import 'dart:collection';

import 'package:evolution_engine/src/domain/exceptions/cards_exception.dart';
import 'package:evolution_engine/src/stores/models/cards/deck/deck_card.dart';

import '../../evolution_engine.dart';

class CardsDeck {
  late final Queue<DeckCard> _cards;

  int _originLength;

  CardsDeck(List<DeckCard> cards) : _originLength = cards.length {
    _cards = Queue<DeckCard>();
    _cards.addAll([...cards]);
  }

  int get originLength => _originLength;

  int get length => _cards.length;

  bool canTakeForPlayers(List<Player> players) {
    var cardsRequired = players
        .map((player) => player.cardsRequired)
        .reduce((value, element) => value + element);

    return canTakeCards(cardsRequired);
  }

  bool canTakeCards(int count) => _cards.length >= count;

  List<DeckCard> pop(int count) {
    if (!canTakeCards(count)) {
      return throw CardsException("There are no cards to be popped");
    }

    var cards = <DeckCard>[];
    for (var i = 0; i < count; i++) {
      cards.add(_cards.removeFirst());
    }

    return cards;
  }
}
