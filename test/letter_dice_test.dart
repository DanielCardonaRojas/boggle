import 'package:boggle/domain/entities/letter_dice.dart';
import 'package:boggle/domain/errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Throws exception when creating from a set of letters with count other than 6',
      () {
    expect(() => LetterDice("abcde"), throwsA(isA<DiceException>()));
  });
}
