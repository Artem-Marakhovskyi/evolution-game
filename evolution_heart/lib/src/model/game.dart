import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_heart/src/model/cards_stack.dart';
import 'package:evolution_heart/src/model/context/ambient_context.dart';

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
    while (_cardsStack.canTake(getCardsRequired())) {}

    return Future.delayed(Duration.zero, () => 32);
  }

  int getCardsRequired() => _players
      .map((player) => player.cardsRequired)
      .reduce((value, element) => value + element);

  void pushCardsToPlayers(Player element) {}
}
