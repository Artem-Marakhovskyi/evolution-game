import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/state/game_state.dart';

import '../bootstrap/dependencies_registry.dart';
import 'phases/round.dart';
import 'entities/scores_calculator.dart';
import 'package:get_it/get_it.dart';
import '../../evolution_engine.dart';
import '../bootstrap/ambient_context.dart';
import 'entities/cards_deck.dart';
import 'entities/die.dart';

class Game {
  late final PlayersStore _playersStore;
  late final AmbientContext _ambientContext;
  late final CardsStore _cardsStore;
  late final CardsDeck _cardsDeck;
  late final Die _die;
  late final Log _log;
  late final OutputWriter _outputWriter;
  final List<Player> _players = <Player>[];

  Game(
    DependenciesExternalModule dependenciesExternalModule,
  ) {
    var _ = DependenciesRegistry(dependenciesExternalModule);

    _die = GetIt.I.get<Die>();
    _log = GetIt.I.get<Log>();
    _ambientContext = GetIt.I.get<AmbientContext>();
    _playersStore = GetIt.I.get<PlayersStore>();
    _cardsStore = GetIt.I.get<CardsStore>();
    _outputWriter = GetIt.I.get<OutputWriter>();
  }

  Future prepare() async {
    _cardsDeck = CardsDeck(await _cardsStore.fetch());
    _players.addAll(await _playersStore.fetch());
  }

  Future start() async {
    var currentRoundIdx = 0;
    while (_cardsDeck.canTakeForPlayers(_players)) {
      // TODO: Prepare: players order
      var roundConfiguration = _createConfiguration();
      await Round(currentRoundIdx, _players, _cardsDeck, _ambientContext, _die,
              _log)
          .play();

      _outputWriter
          .write(GameState("no phase", currentRoundIdx, _players, _cardsDeck));

      currentRoundIdx++;
    }

    var scoreTable = ScoresCalculator(_players).calculate();

    return Future.delayed(Duration.zero, () => null);
  }

  _createConfiguration() {}
}
