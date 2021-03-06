import 'dart:collection';

import 'package:evolution_engine/src/domain/exceptions/cards_exception.dart';

import '../../../evolution_engine.dart';

class CardsDeck {
  late final Queue<DeckCard> _cards;

  final int originLength;

  List<DeckCard> get cards => UnmodifiableListView(_cards);

  CardsDeck(List<DeckCard> cards) : originLength = cards.length {
    _cards = Queue<DeckCard>();
    _cards.addAll([...cards]);
  }

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
