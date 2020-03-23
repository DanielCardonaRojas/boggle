import 'dart:math';

import 'package:boggle/data/dice_reader.dart';
import 'package:boggle/domain/entities/letter_dice.dart';
import 'package:boggle/domain/entities/position.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BoggleBoard extends Equatable {
  final int dimension;
  final List<LetterDice> dice;

  BoggleBoard({@required this.dice, this.dimension = 4});

  static Future<BoggleBoard> fromDiceFile(String fileName) async {
    final diceStrings = await diceReader(fileName);
    final dim = sqrt(diceStrings.length).toInt();
    List<LetterDice> allDice =
        diceStrings.map((letters) => LetterDice(letters)).toList();

    final board = BoggleBoard(dice: allDice, dimension: dim);
    board.updatePositions();
    return board;
  }

  void updatePositions() {
    dice.asMap().forEach((index, dice) {
      final row = index ~/ dimension;
      final col = index % dimension;
      dice.setPosition(row: row, column: col);
    });
  }

  void toggleSelectionForDice(Position position) {
    final index = position.row * dimension + position.col;
    final selected = dice[index];
    final newDice = selected.clone();
    newDice.toggleSelection();
    dice[index] = newDice;
  }

  void shuffle() {
    dice.shuffle();
    dice.forEach((die) {
      die.roll();
    });
    updatePositions();
  }

  @override
  List<Object> get props => [dimension, dice];
}
