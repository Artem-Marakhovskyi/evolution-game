import 'dart:io';

import 'package:evolution_heart/src/bootstrap/dependencies_registry.dart';
import 'package:evolution_heart/src/domain/stores/players_store.dart';
import 'package:get_it/get_it.dart';

import '../bootstrap/ambient_context.dart';
import 'cards_deck.dart';
import 'stages/phase_growth.dart';
import 'stages/phase_young_generation.dart';

import 'player.dart';
import 'stores/cards_store.dart';

class Game {
  late final PlayersStore _playersStore;
  late final AmbientContext _ambientContext;
  late final CardsStore _cardsStore;
  late final CardsDeck _cardsStack;

  final List<Player> _players = <Player>[];

  Game(DependenciesExternalModule? dependenciesExternalModule) {
    var _ = DependenciesRegistry(dependenciesExternalModule);

    _ambientContext = GetIt.I.get<AmbientContext>();
    _playersStore = GetIt.I.get<PlayersStore>();
    _cardsStore = GetIt.I.get<CardsStore>();
  }

  Future prepare() async {
    _cardsStack = CardsDeck(await _cardsStore.fetch());
    _players.addAll(await _playersStore.fetch());
  }

  Future start() {
    while (_cardsStack.canTakeForPlayers(_players)) {
      PhaseYoungGeneration(_players, _cardsStack).pushCards();
      PhaseGrowth();
    }

    return Future.delayed(Duration.zero, () => null);
  }
}
