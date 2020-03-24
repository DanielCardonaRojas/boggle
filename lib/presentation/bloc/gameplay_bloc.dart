import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:boggle/domain/entities/boggle_board.dart';
import 'package:boggle/domain/entities/position.dart';
import 'package:boggle/utilities/logging.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'gameplay_event.dart';
part 'gameplay_state.dart';

class GameplayBloc extends Bloc<GameplayEvent, GameplayState> with Logging {
  @override
  GameplayState get initialState => LoadingBoard();

  @override
  Stream<GameplayState> mapEventToState(
    GameplayEvent event,
  ) async* {
    log.d(event);
    if (event is CreateGame) {
      final loadedBoard = await BoggleBoard.fromDiceFile('dice.txt');
      yield LoadedBoard(loadedBoard.shuffled());
    } else if (event is SelectedLetter) {
      GameplayState newState = state;
      if (newState is LoadedBoard) {
        var newBoard = newState.board.togglingSelectionForDice(event.position);
        yield LoadedBoard(newBoard);
      }
    } else {
      yield LoadingBoard();
    }
  }
}
