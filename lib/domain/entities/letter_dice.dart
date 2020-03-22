import 'package:boggle/domain/entities/boggle_board.dart';
import 'package:boggle/domain/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

mixin BoardPositioned {
  int row;
  int col;

  bool get hasPosition {
    return row != null && col != null;
  }

  void setPosition({@required int row, @required int column}) {
    this.row = row;
    this.col = column;
  }
}

class LetterDice extends Equatable with BoardPositioned {
  final String letters;

  String get topLetter {
    return letters[0];
  }

  LetterDice(this.letters) {
    if (letters.length != 6) {
      throw DiceException('Dice must contain 6 letters');
    }
  }

  void roll() {}

  @override
  List<Object> get props => [letters];

  @override
  bool get stringify => true;
}
