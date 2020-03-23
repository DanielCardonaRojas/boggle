part of 'gameplay_bloc.dart';

abstract class GameplayEvent extends Equatable {
  const GameplayEvent();

  @override
  bool get stringify => true;
}

class SelectedLetter extends GameplayEvent {
  final Position position;
  final String letter;

  SelectedLetter({
    @required this.position,
    @required this.letter,
  });

  @override
  List<Object> get props => [position, letter];
}

class CreateGame extends GameplayEvent {
  final int boardDimension;

  CreateGame({@required this.boardDimension});

  @override
  List<Object> get props => [boardDimension];
}
