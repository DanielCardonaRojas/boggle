import 'package:boggle/domain/entities/letter_dice.dart';
import 'package:boggle/domain/errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Throws exception when creating from a set of letters with count other than 6',
      () {
    expect(() => LetterDice("abcde"), throwsA(isA<DiceException>()));
  });

  test('is not equal to copy with selected state toggled', () {
    final dice1 = LetterDice("abcdef");
    final dice2 = LetterDice("abcdef");
    assert(dice1 == dice2);

    dice2.toggleSelection();
    assert(dice1 != dice2);
  });

  test('clone has difference hashCode', () {
    final dice1 = LetterDice("abcdef");
    final dice2 = dice1.clone();
    assert(dice1.hashCode != dice2.hashCode);
  });
}
