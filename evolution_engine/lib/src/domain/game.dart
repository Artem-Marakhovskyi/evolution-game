import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/phases/phase_kind.dart';
import 'package:evolution_engine/src/domain/state/game_state.dart';
import 'package:evolution_engine/src/domain/state/game_state_initializer.dart';

import '../bootstrap/dependencies_registry.dart';
import 'entities/game_config.dart';
import 'phases/round.dart';
import 'entities/scores_calculator.dart';
import 'package:get_it/get_it.dart';
import '../../evolution_engine.dart';
import '../bootstrap/ambient_context.dart';
import 'entities/cards_deck.dart';
import 'entities/die.dart';

class Game {
  final GetIt resolver;
  late final GameConfig _config;
  late final CardsStore _cardsStore;
  late final Die _die;
  late final Log _log;
  late final OutputWriter _outputWriter;
  late final PlayersStore _playersStore;

  final List<Player> _players = <Player>[];
  late CardsDeck _cardsDeck;
  late GameState _state;

  Game(DependenciesExternalModule dependenciesExternalModule,
      [GameState? state, GameConfig? config])
      : resolver = DependenciesRegistry(dependenciesExternalModule).resolver {
    _die = resolver.get<Die>();
    _log = resolver.get<Log>();
    _playersStore = resolver.get<PlayersStore>();
    _cardsStore = resolver.get<CardsStore>();
    _outputWriter = resolver.get<OutputWriter>();
    _state = state ?? GameState.empty();
    _config = config ?? GameConfig.empty();
  }

  Future start() async {
    _players.addAll(await _playersStore.fetch());
    _cardsDeck = CardsDeck(await _cardsStore.fetch());

    if (_state.isEmpty) {
      _state = GameState(
          Round.initialPhaseKind, Round.initialRound, _players, _cardsDeck);
    }

    while (_cardsDeck.canTakeForPlayers(_players)) {
      await Round(_state.currentRound, _state.currentPhase,
              _config.phaseToPlayUntil, _players, _cardsDeck, _die, _log)
          .play();

      _outputWriter.write(_state);

      if (_config.roundToPlayUntil >= _state.currentRound + 1) {
        return;
      }

      _state = GameState(Round.initialPhaseKind, _state.currentRound + 1,
          shift([..._players]), _cardsDeck);
    }

    var scoreTable = ScoresCalculator(_players).calculate();
  }

  List<Player> shift(List<Player> players) {
    var last = players.removeLast();
    return [last, ...players];
  }
}
