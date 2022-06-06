import 'package:cross_cutting/cross_cutting.dart';

import '../../../evolution_engine.dart';
import '../entities/feeder.dart';
import 'phase.dart';
import 'phase_kind.dart';

/// Input:
///
class PhaseFeeding extends Phase {
  final Feeder _feeder;
  final List<Player> _players;
  PhaseFeeding(this._feeder, this._players, Log log)
      : super(log, PhaseKind.FEEDING);

  Future perform() async {
    verbose("started");
    verbose("completed");
  }
}
