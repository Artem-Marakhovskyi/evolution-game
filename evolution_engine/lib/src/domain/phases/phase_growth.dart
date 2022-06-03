import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/stores/models/player.dart';

import 'phase.dart';
import 'phase_kind.dart';

class PhaseGrowth extends Phase {
  final List<Player> _players;
  PhaseGrowth(this._players, Log log) : super(log, PhaseKind.GROWTH);

  Future perform() async {
    verbose('started');
    while (_players.any((player) => !player.hasPassedThisRound)) {
      for (var player in _players) {
        if (!player.hasPassedThisRound) {
          player.playHandCard();
        }
      }
    }
    verbose('completed');
  }
}
