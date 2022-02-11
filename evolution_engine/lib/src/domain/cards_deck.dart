import 'dart:collection';

import '../../evolution_heart.dart';
import 'entities/cards/card.dart';

class CardsDeck {
  late final Queue<Card> _cards;

  CardsDeck(List<Card> cards) {
    _cards = Queue<Card>();
    _cards.addAll([...cards]..shuffle());
  }

  bool canTakeForPlayers(List<Player> players) {
    var cardsRequired = players
        .map((player) => player.cardsRequired)
        .reduce((value, element) => value + element);

    return canTakeCards(cardsRequired);
  }

  bool canTakeCards(int count) => _cards.length >= count;

  Card? pop(int count) {
    if (canTakeCards(count)) {
      return null;
    }
    return _cards.removeFirst();
  }
}
