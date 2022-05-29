import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/bootstrap/ambient_context.dart';
import 'package:evolution_engine/src/domain/exceptions/cards_exception.dart';

import '../../../evolution_engine.dart';
import '../entities/cards_deck.dart';
import '../entities/die.dart';
import 'phase_growth.dart';
import 'phase_young_generation.dart';

class Round {
  final CardsDeck _cardsDeck;
  final List<Player> _players;
  final AmbientContext _ambientContext;
  final Die _die;
  final Log _log;
  final int idx;

  Round(this.idx, this._players, this._cardsDeck, this._ambientContext,
      this._die, this._log);

  Future play() async {
    _log.verbose("================= Round $idx STARTED =================");
    try {
      await PhaseYoungGeneration(_players, _cardsDeck, _log).perform();
    } on CardsException catch (ex) {
      _log.info(ex.message);
    }

    await PhaseGrowth(_players, _log).perform();
    // var feeder = await PhaseSupply(_die, _players.length, _log).getFeeder();
    // await PhaseFeeding(feeder, _players, _log).perform();
    // await PhaseExtinction(_players, _log).perform();
    _log.verbose("================= Round $idx COMPLETED =================");
  }
}
