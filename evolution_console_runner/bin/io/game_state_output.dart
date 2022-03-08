import 'package:evolution_engine/src/io/output/models/game_state.dart';

class GameStateOutput {
  void write(GameState gs) {
    var buffer = StringBuffer();
    buffer.writeln("Round: ${gs.currentRound}, Phase: ${gs.currentPhase}, ");
  }
}
