import 'package:boggle/domain/entities/boggle_board.dart';
import 'package:boggle/presentation/widgets/letter_dice_widget.dart';
import 'package:flutter/material.dart';

class BoggleBoardWidget extends StatelessWidget {
  final BoggleBoard board;

  const BoggleBoardWidget({Key key, @required this.board}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: buildRows(context),
      ),
    );
  }

  List<Row> buildRows(BuildContext context) {
    List<Row> rows = [];

    for (var k = 0; k < board.dimension; k++) {
      final diceForRow = board.dice.where((dice) => dice.row == k);
      print(diceForRow);

      final diceWidgets =
          diceForRow.map((die) => LetterDiceWidget(dice: die)).toList();

      final row = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: diceWidgets,
      );
      rows.add(row);
    }

    return rows;
  }
}
