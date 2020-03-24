import 'package:boggle/domain/entities/boggle_board.dart';
import 'package:boggle/domain/entities/boggle_dice.dart';
import 'package:boggle/domain/entities/position.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final tBoard = await BoggleBoard.fromDiceFile('dice.txt');

  test('boggle board reads non empty list dice from file', () async {
    assert(tBoard.dimension > 0);
    assert(tBoard.dice.length == (tBoard.dimension * tBoard.dimension));
  });

  test('board equality changes after toggleling selection for dice', () {
    // No clone for objects in dart
    final List<BoggleDice> newList = []..addAll(tBoard.dice);

    var newBoard = BoggleBoard((board) => board
      ..dice.addAll(newList)
      ..dimension = tBoard.dimension).togglingSelectionForDice(
      Position(0, 0),
    );

    assert(newBoard.dice.first != tBoard.dice.first);
    expect(newBoard, isNot(tBoard));
  });

  test('board contains n rows and columns', () {
    for (var k = 0; k < tBoard.dimension; k++) {
      final diceForRow = tBoard.dice.where((dice) => dice.position.row == k);
      assert(diceForRow.length == tBoard.dimension);
    }
  });

  test('fromDiceFile injects board positions into letter dice', () async {
    final allCount = tBoard.dice.length;
    final newBoard = tBoard
        .rebuild((board) => board..dice.where((dice) => dice.hasPosition));
    assert(allCount == newBoard.dice.length);
  });

  test('Shuffling board changes order or dice array', () async {
    //arrange
    final List<BoggleDice> initialDice = List.from(tBoard.dice);
    final newBoard = tBoard.shuffled();

    expect(initialDice, isNot(newBoard.dice));
  });
}
