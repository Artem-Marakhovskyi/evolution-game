import 'package:evolution_engine/src/domain/phases/phase_feeding.dart';
import 'package:evolution_engine/src/stores/models/player.dart';

import 'phase.dart';

class PhaseGrowth extends Phase {
  final List<Player> _players;
  PhaseGrowth(this._players);

  Future perform() async {}
}
