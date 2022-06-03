import 'dart:convert';

import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';

class ConsoleOutputWriter extends OutputWriter {
  final Log _log;
  ConsoleOutputWriter(this._log);

  @override
  Future write(GameState gameState) {
    _log.info(gameState.toString());
    return Future.value();
  }
}
