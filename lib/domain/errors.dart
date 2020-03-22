import 'package:equatable/equatable.dart';

class DiceException extends Equatable {
  final String message;

  DiceException(this.message);

  @override
  List<Object> get props => [message];
}
