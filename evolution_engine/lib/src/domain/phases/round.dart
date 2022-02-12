import 'package:evolution_engine/src/bootstrap/ambient_context.dart';
import 'package:evolution_engine/src/domain/phases/phase_extinction.dart';
import 'package:evolution_engine/src/domain/phases/phase_feeding.dart';
import 'package:evolution_engine/src/domain/phases/phase_supply.dart';

import '../../../evolution_engine.dart';
import '../cards_deck.dart';
import '../die.dart';
import '../feeder.dart';
import 'phase_growth.dart';
import 'phase_young_generation.dart';

class Round {
  final CardsDeck _cardsStack;
  final List<Player> _players;
  final AmbientContext _ambientContext;
  final Die _die;

  Round(this._players, this._cardsStack, this._ambientContext, this._die);

  Future play() async {
    // TODO: handle CardsException
    await PhaseYoungGeneration(_players, _cardsStack).perform();
    await PhaseGrowth(_players).perform();
    var feeder = await PhaseSupply(_die, _players.length).getFeeder();
    await PhaseFeeding(feeder, _players).perform();
    await PhaseExtinction(_players).perform();
  }
}
