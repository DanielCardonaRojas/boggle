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

mixin BoardPositioned {
  Position position;

  bool get hasPosition {
    return position != null && position.row != null && position.col != null;
  }

  int get row {
    return position.row;
  }

  int get col {
    return position.col;
  }

  void setPosition({@required int row, @required int column}) {
    this.position = Position(row, column);
  }
}
