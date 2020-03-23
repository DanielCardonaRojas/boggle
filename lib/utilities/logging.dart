import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

mixin Logging {
  Logger _logger;

  Logger get log {
    return _logger ??= Logger(
      printer: SimpleLogPrinter(scope: '$runtimeType', colorsEnabled: false),
    );
  }
}

class SimpleLogPrinter extends LogPrinter {
  final String scope;
  final bool colorsEnabled;

  SimpleLogPrinter({
    @required this.scope,
    this.colorsEnabled = false,
  });

  @override
  List<String> log(LogEvent event) {
    final logColor = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;
    final loggedMessage = '$emoji $scope - $message';
    final text = colorsEnabled ? logColor(loggedMessage) : loggedMessage;
    return [text];
  }
}
