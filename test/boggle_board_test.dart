import 'package:boggle/domain/entities/boggle_board.dart';
import 'package:boggle/domain/entities/letter_dice.dart';
import 'package:boggle/domain/entities/position.dart';
import 'package:boggle/domain/entities/selectable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLetterDice extends Mock implements LetterDice {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final tBoard = await BoggleBoard.fromDiceFile('dice.txt');

  test('boggle board reads non empty list dice from file', () async {
    assert(tBoard.dimension > 0);
    assert(tBoard.dice.length == (tBoard.dimension * tBoard.dimension));
  });

  test('board equality changes after toggleling selection for dice', () {
    // No clone for objects in dart
    final List<LetterDice> newList = []..addAll(tBoard.dice);
    var newBoard = BoggleBoard(dice: newList, dimension: tBoard.dimension);
    newBoard.toggleSelectionForDice(Position(0, 0));

    assert(newBoard.dice.first != tBoard.dice.first);
    expect(newBoard, isNot(tBoard));
  });

  test('board contains n rows and columns', () {
    for (var k = 0; k < tBoard.dimension; k++) {
      final diceForRow = tBoard.dice.where((dice) => dice.row == k);
      assert(diceForRow.length == tBoard.dimension);
    }
  });

  test('fromDiceFile injects board positions into letter dice', () async {
    final allCount = tBoard.dice.length;
    tBoard.dice.retainWhere((dice) => dice.hasPosition);
    final withPositionCount = tBoard.dice.length;
    assert(allCount == withPositionCount);
  });

  test('Shuffling board calls roll on each dice', () {
    final dice = MockLetterDice();
    final board = BoggleBoard(dimension: 1, dice: [dice]);

    board.shuffle();
    verify(dice.roll());
  });

  test('Shuffling board changes order or dice array', () async {
    //arrange
    final List<LetterDice> initialDice = List.from(tBoard.dice);
    tBoard.shuffle();

    expect(initialDice, isNot(tBoard.dice));
  });
}
