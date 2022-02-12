import 'package:cross_cutting/cross_cutting.dart';

import '../../../evolution_engine.dart';
import '../feeder.dart';
import 'phase.dart';

class PhaseFeeding extends Phase {
  final Feeder _feeder;
  final List<Player> _players;
  PhaseFeeding(this._feeder, this._players, Log log) : super(log, 'Feeding');

  Future perform() async {}
}
