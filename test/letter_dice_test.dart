import 'package:boggle/domain/entities/boggle_dice.dart';
import 'package:boggle/domain/errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Throws exception when creating from a set of letters with count other than 6',
      () {
    expect(
        () => BoggleDice.fromLetters("abcde"), throwsA(isA<DiceException>()));
  });

  test('is not equal to copy with selected state toggled', () {
    final dice1 = BoggleDice.fromLetters("abcdef");
    final dice2 = dice1.toggleSelected();
    assert(dice1 != dice2);
  });
}
