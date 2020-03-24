library boggle_dice;

import 'dart:convert';
import 'dart:math';
import 'package:boggle/domain/errors.dart';
import 'package:meta/meta.dart';

import 'package:boggle/domain/entities/position.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boggle_dice.g.dart';

abstract class BoggleDice implements Built<BoggleDice, BoggleDiceBuilder> {
  // fields go here
  String get letters;

  @nullable
  int get selectedFaceIndex;

  @nullable
  Position get position;

  bool get isSelected;

  // Computed fields
  String get topLetter {
    return letters[selectedFaceIndex];
  }

  bool get hasPosition {
    return position != null && position.row != null && position.col != null;
  }

  // Updates
  BoggleDice roll() {
    return rebuild(
        (b) => b..selectedFaceIndex = Random().nextInt(letters.length - 1));
  }

  BoggleDice setPosition({@required int row, @required int column}) {
    return rebuild(
      (b) => b..position = Position(row, column),
    );
  }

  BoggleDice toggleSelected() {
    return rebuild((b) => b..isSelected = !b.isSelected);
  }

  //Constructors
  factory BoggleDice([updates(BoggleDiceBuilder b)]) = _$BoggleDice;

  BoggleDice._();

  factory BoggleDice.fromLetters(String letters) {
    if (letters.length != 6) {
      throw DiceException('Dice must be formed from 6 letters');
    }
    return BoggleDice((b) => b
      ..letters = letters
      ..isSelected = false);
  }
}
