import 'dart:collection';

import 'package:evolution_engine/src/stores/models/single_card.dart';

import '../../evolution_engine.dart';

class CardsDeck {
  late final Queue<SingleCard> _cards;

  CardsDeck(List<SingleCard> cards) {
    _cards = Queue<SingleCard>();
    _cards.addAll([...cards]..shuffle());
  }

  bool canTakeForPlayers(List<Player> players) {
    var cardsRequired = players
        .map((player) => player.cardsRequired)
        .reduce((value, element) => value + element);

    return canTakeCards(cardsRequired);
  }

  bool canTakeCards(int count) => _cards.length >= count;

  SingleCard? pop(int count) {
    if (canTakeCards(count)) {
      return null;
    }
    return _cards.removeFirst();
  }
}
