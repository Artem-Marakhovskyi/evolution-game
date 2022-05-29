import 'package:simple_logger/simple_logger.dart';

class Log {
  final _logger = SimpleLogger();

  Log() {
    _logger.setLevel(
      Level.ALL,
    );
    _logger.formatter = (info) => '${DateTime.now()} ${info.message}';
  }

  void verbose(String message) {
    _log(_LogLevel.verbose, message);
  }

  void debug(String message) {
    _log(_LogLevel.debug, message);
  }

  void info(String message) {
    _log(_LogLevel.info, message);
  }

  void warn(String message, [Exception? ex]) {
    if (ex == null) {
      _log(_LogLevel.warn, message);
    } else {
      _log(_LogLevel.warn, '<no_message>', ex);
    }
  }

  void error(Exception ex) {
    _log(_LogLevel.error, '<no_message>', ex);
  }

  void fatal(Exception ex) {
    _log(_LogLevel.fatal, '<no_message>', ex);
  }

  void _log(_LogLevel level, [String? message, Exception? ex]) {
    switch (level) {
      case _LogLevel.verbose:
        _logger.finest(message);
        break;
      case _LogLevel.debug:
        _logger.fine(message);
        break;
      case _LogLevel.info:
        _logger.info(message);
        break;
      case _LogLevel.warn:
        _logger.warning(ex);
        break;
      case _LogLevel.error:
        _logger.severe(message);
        break;
      case _LogLevel.fatal:
        _logger.shout(message);
        break;
    }
  }
}

enum _LogLevel {
  verbose,
  debug,
  info,
  warn,
  error,
  fatal,
}
