import 'dart:convert';

import 'package:cross_cutting/src/log.dart';
import 'package:evolution_engine/evolution_engine.dart';
import 'package:evolution_engine/src/io/output/models/game_state.dart';

import 'game_state_output.dart';

class ConsoleOutputWriter extends OutputWriter {
  final Log _log;
  ConsoleOutputWriter(this._log);

  @override
  Future write(GameState gameState) {
    _log.info(gameState.toJson());
    var output = GameStateOutput();
    output.write(gameState);

    return Future.value();
  }
}
