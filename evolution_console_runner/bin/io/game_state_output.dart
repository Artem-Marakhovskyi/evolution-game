import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/state/game_state.dart';

class GameStateOutput {
  static const int indent = 4;

  final Log _log;

  GameStateOutput(this._log);
  void write(GameState gs) {
    var buffer = StringBuffer();
    buffer.writeln("\nRound: ${gs.currentRound}, Phase: ${gs.currentPhase} ");

    for (var player in gs.playersOrder) {
      buffer.writeln(
          "${getIndent()}Player ${player.id}, hand: ${player.handsCards.length}, animals: ${player.animals.length}");
      buffer.write("${getIndent(2)}Hand cards: ");

      int handCardCount = 1;
      for (var handCard in player.handsCards) {
        var write = handCardCount % 3 == 0 ? buffer.writeln : buffer.write;
        var addition =
            handCardCount % 3 == 1 && handCardCount > 1 ? getIndent(3) : "";
        write(
            "${addition}${handCard.ego}${handCard.alterEgo.isEmpty ? "" : "/" + handCard.alterEgo},");
        handCardCount++;
      }
    }
    _log.info(buffer.toString());
  }

  String getIndent([int count = 1]) => ' ' * indent * count;
}
