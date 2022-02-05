import 'dart:collection';

import 'cards/card.dart';

class CardsStack {
  late final Queue<Card> _cards;

  CardsStack(List<Card> cards) {
    _cards = Queue<Card>();
    _cards.addAll([...cards]..shuffle());
  }

  bool canTake(int count) => _cards.length >= count;

  Card? pop() {
    if (_cards.isEmpty) {
      return null;
    }
    return _cards.removeFirst();
  }
}
