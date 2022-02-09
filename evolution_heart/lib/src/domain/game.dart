import '../bootstrap/ambient_context.dart';
import 'cards_stack.dart';
import 'stages/phase_growth.dart';
import 'stages/phase_young_generation.dart';

import 'player.dart';
import 'stores/cards_store.dart';

class Game {
  final List<Player> _players;
  final AmbientContext _ambientContext;
  final CardsStore _cardsStore;

  late final CardsStack _cardsStack;

  Game(
    this._players,
    this._ambientContext,
    this._cardsStore,
  ) {}

  Future prepare() async {
    _cardsStack = CardsStack(await _cardsStore.fetchCards());
  }

  Future start() {
    while (_cardsStack.canTake(getCardsRequired())) {
      PhaseYoungGeneration(_players, _cardsStack).pushCards();
      PhaseGrowth();
    }

    return Future.delayed(Duration.zero, () => null);
  }

  int getCardsRequired() => _players
      .map((player) => player.cardsRequired)
      .reduce((value, element) => value + element);

  void pushCardsToPlayers(Player element) {}
}
