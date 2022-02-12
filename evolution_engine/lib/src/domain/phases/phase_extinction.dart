import 'package:cross_cutting/cross_cutting.dart';

import '../../../evolution_engine.dart';
import 'phase.dart';

class PhaseExtinction extends Phase {
  final List<Player> _players;
  PhaseExtinction(this._players, Log log) : super(log, 'Extinction');
  Future perform() async {
    verbose('started');
    // TODO: Do in parallel
    for (var player in _players) {
      player.removeHungryAnimals();
      verbose('hungry animals of ${player.name} are killed');
    }

    verbose('completed');
  }
}
