part of 'gameplay_bloc.dart';

abstract class GameplayState extends Equatable {
  const GameplayState();
}

class LoadingBoard extends GameplayState {
  @override
  List<Object> get props => [];
}

class LoadedBoard extends GameplayState {
  final BoggleBoard board;

  LoadedBoard(this.board);

  @override
  List<Object> get props => [board];
}
