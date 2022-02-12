import '../die.dart';
import '../feeder.dart';
import 'phase.dart';

class PhaseSupply extends Phase {
  final Die _die;
  final int _playersCount;
  PhaseSupply(this._die, this._playersCount);

  Future getFeeder() async {
    var feeder = Feeder.fromPlayers(_die, _playersCount);

    return feeder;
  }
}
