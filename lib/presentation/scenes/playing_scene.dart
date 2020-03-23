import 'package:boggle/domain/entities/boggle_board.dart';
import 'package:boggle/presentation/bloc/gameplay_bloc.dart';
import 'package:boggle/presentation/widgets/boggle_board_widget.dart';
import 'package:boggle/utilities/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayingScene extends StatelessWidget with Logging {
  final GameplayBloc bloc = GameplayBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boggle word'),
      ),
      body: Center(
        child: SizedBox(
          height: 800,
          width: 800,
          child: buildBody(),
        ),
      ),
    );
  }

  BlocProvider<GameplayBloc> buildBody() {
    return BlocProvider(
        create: (context) => bloc,
        child:
            BlocBuilder<GameplayBloc, GameplayState>(builder: (context, state) {
          log.d('Triggering rebuild for state: $state');
          if (state is LoadedBoard) {
            return BoggleBoardWidget(board: state.board);
          } else if (state is LoadingBoard) {
            BlocProvider.of<GameplayBloc>(context)
                .add(CreateGame(boardDimension: 4));
            return Text('Loading...');
          }
        }));
  }
}
