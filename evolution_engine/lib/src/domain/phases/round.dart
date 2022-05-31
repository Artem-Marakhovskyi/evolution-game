import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/bootstrap/ambient_context.dart';
import 'package:evolution_engine/src/domain/exceptions/cards_exception.dart';

import '../../../evolution_engine.dart';
import '../entities/cards_deck.dart';
import '../entities/die.dart';
import 'phase_extinction.dart';
import 'phase_feeding.dart';
import 'phase_growth.dart';
import 'phase_kind.dart';
import 'phase_reproduction.dart';
import 'phase_supply.dart';

class Round {
  static const PhaseKind initialPhaseKind = PhaseKind.reproduction;
  static const int initialRound = 0;

  final CardsDeck _cardsDeck;
  final List<Player> _players;
  final Die _die;
  final Log _log;
  final int idx;

  final PhaseKind _untilPhaseKind;
  PhaseKind _currentPhase;

  Round(this.idx, this._currentPhase, this._untilPhaseKind, this._players,
      this._cardsDeck, this._die, this._log)
      : assert(_currentPhase != PhaseKind.none),
        assert(idx >= 0);

  Future play() async {
    _log.verbose("================= Round $idx STARTED =================");

    if (canPlay(PhaseKind.reproduction)) {
      try {
        await PhaseReproduction(_players, _cardsDeck, _log).perform();
      } on CardsException catch (ex) {
        _log.info(ex.message);
      }
      _currentPhase = PhaseKind.growth;
    }

    if (canPlay(PhaseKind.growth)) {
      await PhaseGrowth(_players, _log).perform();
      _currentPhase = PhaseKind.supply;
    }

    if (canPlay(PhaseKind.supply)) {
      var feeder = await PhaseSupply(_die, _players.length, _log).getFeeder();
      await PhaseFeeding(feeder, _players, _log).perform();
      _currentPhase = PhaseKind.extinction;
    }

    if (canPlay(PhaseKind.extinction)) {
      await PhaseExtinction(_players, _log).perform();
      _currentPhase = PhaseKind.none;
    }

    _log.verbose("================= Round $idx COMPLETED =================");
  }

  bool canPlay(PhaseKind phaseKind) =>
      _currentPhase.index <= phaseKind.index &&
      _untilPhaseKind.index > phaseKind.index;
}
