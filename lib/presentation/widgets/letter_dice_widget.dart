import 'package:boggle/domain/entities/letter_dice.dart';
import 'package:boggle/presentation/bloc/gameplay_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LetterDiceWidget extends StatelessWidget {
  final LetterDice dice;

  const LetterDiceWidget({Key key, this.dice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: dice.isSelected ? Colors.blue : Colors.white,
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(10),
      child: FittedBox(
          fit: BoxFit.fitHeight,
          child: FlatButton(
            child: Text(
              dice.topLetter,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            onPressed: () {
              BlocProvider.of<GameplayBloc>(context).add(
                SelectedLetter(
                  letter: dice.topLetter,
                  position: dice.position,
                ),
              );
            },
          )),
    );
  }
}
