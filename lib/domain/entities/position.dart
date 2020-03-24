import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Position extends Equatable {
  final int row;
  final int col;

  Position(this.row, this.col);

  @override
  List<Object> get props => [row, col];

  @override
  bool get stringify => true;
}
