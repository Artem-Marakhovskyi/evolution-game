import 'package:cross_cutting/cross_cutting.dart';

import '../../../evolution_engine.dart';
import 'phase.dart';
import 'phase_kind.dart';

/// Input: players -> animals
/// Processing: Kill hungry animals
class PhaseExtinction extends Phase {
  final List<Player> _players;
  PhaseExtinction(this._players, Log log) : super(log, PhaseKind.EXTINCTION);
  Future perform() async {
    verbose('started');
    for (var player in _players) {
      player.removeHungryAnimals();
      verbose('hungry animals of ${player.name} are killed');
    }

    verbose('completed');
  }
}
