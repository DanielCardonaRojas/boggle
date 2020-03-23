import 'dart:math';

import 'package:boggle/domain/entities/position.dart';
import 'package:boggle/domain/entities/selectable.dart';
import 'package:boggle/domain/errors.dart';
import 'package:equatable/equatable.dart';

class LetterDice extends Equatable with BoardPositioned, Selectable {
  final String letters;
  int _selectedFaceIndex = 0;

  String get topLetter {
    return letters[_selectedFaceIndex];
  }

  LetterDice(this.letters) {
    if (letters.length != 6) {
      throw DiceException('Dice must contain 6 letters');
    }
  }

  void roll() {
    _selectedFaceIndex = Random().nextInt(letters.length - 1);
  }

  LetterDice clone() {
    final newDice = LetterDice(letters);
    newDice.position = position;
    newDice._selectedFaceIndex = _selectedFaceIndex;
    newDice.selectedState.setSelected(isSelected);
    return newDice;
  }

  @override
  List<Object> get props => [letters, _selectedFaceIndex, isSelected, position];

  @override
  bool get stringify => true;
}
