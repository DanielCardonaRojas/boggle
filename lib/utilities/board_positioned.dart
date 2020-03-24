import 'package:boggle/domain/entities/position.dart';
import 'package:meta/meta.dart';

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
