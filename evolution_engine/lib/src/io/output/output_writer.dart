import 'dart:convert';

import 'package:cross_cutting/cross_cutting.dart';
import 'models/game_state.dart';

class OutputWriter {
  final Log log;
  OutputWriter(this.log);
  Future write(GameState gameState) {
    log.info(jsonEncode(gameState.toJson()));

    return Future.value();
  }
}
