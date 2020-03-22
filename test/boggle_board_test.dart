import 'package:boggle/domain/entities/boggle_board.dart';
import 'package:boggle/domain/entities/letter_dice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLetterDice extends Mock implements LetterDice {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final tBoard = await BoggleBoard.fromDiceFile('dice.txt');
  test('boggle board reads non empty list dice from file', () async {
    assert(tBoard.dimension > 0);
    assert(tBoard.dice.length == tBoard.dimension * tBoard.dimension);
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
