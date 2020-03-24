library boggle_board;

import 'dart:math';
import 'package:boggle/data/dice_reader.dart';
import 'package:boggle/domain/entities/position.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'boggle_dice.dart';

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boggle_board.g.dart';

abstract class BoggleBoard implements Built<BoggleBoard, BoggleBoardBuilder> {
  int get dimension;
  BuiltList<BoggleDice> get dice;

  BoggleBoard._();
  factory BoggleBoard([updates(BoggleBoardBuilder b)]) = _$BoggleBoard;

  static Future<BoggleBoard> fromDiceFile(String fileName) async {
    final diceStrings = await diceReader(fileName);
    final dim = sqrt(diceStrings.length).toInt();
    List<BoggleDice> allDice =
        diceStrings.map((letters) => BoggleDice.fromLetters(letters)).toList();

    final board = BoggleBoard((b) => b
      ..dice.addAll(allDice)
      ..dimension = dim);
    return board.updatePositions();
  }

  BoggleBoard updatePositions() {
    final List<BoggleDice> newDices = List();
    dice.asMap().forEach((index, d) {
      final row = index ~/ dimension;
      final col = index % dimension;
      final newDice = d.setPosition(row: row, column: col);
      newDices.add(newDice);
    });

    return rebuild((b) => b..dice.setAll(0, newDices));
  }

  BoggleBoard togglingSelectionForDice(Position position) {
    final index = position.row * dimension + position.col;
    final selected = dice[index];
    return rebuild(
      (board) => board
        ..dice.update(
          (b) => b..[index] = selected.toggleSelected(),
        ),
    );
  }

  BoggleBoard shuffled() {
    return rebuild((board) => board
      ..dice.update((b) => b
        ..shuffle()
        ..map((dice) => dice.roll()))).updatePositions();
  }
}
