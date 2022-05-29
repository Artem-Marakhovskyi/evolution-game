import 'package:cross_cutting/cross_cutting.dart';

import '../entities/die.dart';
import '../entities/feeder.dart';
import 'phase.dart';

class PhaseSupply extends Phase {
  final Die _die;
  final int _playersCount;
  PhaseSupply(this._die, this._playersCount, Log log) : super(log, 'Supply');

  Future<Feeder> getFeeder() async {
    verbose('started');
    var feeder = Feeder.fromPlayers(_die, _playersCount);

    verbose('completed with ($feeder)');
    return feeder;
  }
}
