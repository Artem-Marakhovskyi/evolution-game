import 'dart:collection';

import 'package:evolution_engine/src/domain/exceptions/cards_exception.dart';
import 'package:evolution_engine/src/stores/models/cards/deck_card.dart';

import '../../evolution_engine.dart';

class CardsDeck {
  late final Queue<DeckCard> _cards;

  CardsDeck(List<DeckCard> cards) {
    _cards = Queue<DeckCard>();
    _cards.addAll([...cards]..shuffle());
  }

  bool canTakeForPlayers(List<Player> players) {
    var cardsRequired = players
        .map((player) => player.cardsRequired)
        .reduce((value, element) => value + element);

    return canTakeCards(cardsRequired);
  }

  bool canTakeCards(int count) => _cards.length >= count;

  DeckCard pop(int count) {
    if (canTakeCards(count)) {
      return throw CardsException("There are no cards to be popped");
    }
    return _cards.removeFirst();
  }
}
