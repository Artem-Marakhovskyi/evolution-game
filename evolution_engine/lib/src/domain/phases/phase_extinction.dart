import '../../../evolution_engine.dart';
import 'phase.dart';

class PhaseExtinction extends Phase {
  final List<Player> _players;
  PhaseExtinction(this._players);
  Future perform() async {
    // TODO: Do in parallel
    for (var player in _players) {
      player.removeHungryAnimals();
    }
  }
}
