import 'dart:collection';

import 'store.dart';
import 'models/cards/card_kinds.dart';
import 'models/cards/deck/deck_card.dart';
import 'models/cards/deck/tuple_deck_card.dart';

class CardsStore extends Store<DeckCard> {
  final Map<_DeckCardTemplate, int> _cardsSet = <_DeckCardTemplate, int>{
    _DeckCardTemplate.single(CardKinds.CAMOUFLAGE): 4,
    _DeckCardTemplate.single(CardKinds.BURROWING): 4,
    _DeckCardTemplate.single(CardKinds.SHARP_VISION): 4,
    _DeckCardTemplate.single(CardKinds.SYMBIOSIS): 4,
    _DeckCardTemplate.single(CardKinds.PIRACY): 4,
    _DeckCardTemplate.single(CardKinds.GRAZING): 4,
    _DeckCardTemplate.single(CardKinds.TAIL_LOSS): 4,
    _DeckCardTemplate.single(CardKinds.HIBERNATION_ABILITY): 4,
    _DeckCardTemplate.single(CardKinds.POISONOUS): 4,
    _DeckCardTemplate.single(CardKinds.COMMUNICATION): 4,
    _DeckCardTemplate.single(CardKinds.SCAVENGER): 4,
    _DeckCardTemplate.single(CardKinds.RUNNING): 4,
    _DeckCardTemplate.single(CardKinds.MIMICRY): 4,
    _DeckCardTemplate.single(CardKinds.SWIMMING): 8,
    _DeckCardTemplate.tuple(CardKinds.PARASITE, CardKinds.CARNIVOROUS): 4,
    _DeckCardTemplate.tuple(CardKinds.PARASITE, CardKinds.FAT_TISSUE): 4,
    _DeckCardTemplate.tuple(CardKinds.COOPERATION, CardKinds.CARNIVOROUS): 4,
    _DeckCardTemplate.tuple(CardKinds.COOPERATION, CardKinds.FAT_TISSUE): 4,
    _DeckCardTemplate.tuple(CardKinds.HIGH_BODY_WEIGHT, CardKinds.CARNIVOROUS):
        4,
    _DeckCardTemplate.tuple(CardKinds.HIGH_BODY_WEIGHT, CardKinds.FAT_TISSUE):
        4,
    _DeckCardTemplate.single(CardKinds.FLIGHTY): 4,
    _DeckCardTemplate.single(CardKinds.HOMEOTHERMY): 4,
    _DeckCardTemplate.single(CardKinds.R_STRATEGY): 4,
  };

  final List<DeckCard> _cards = [];

  List<DeckCard> get cards {
    return UnmodifiableListView(_cards);
  }

  CardsStore() {
    for (var template in _cardsSet.keys) {
      for (var i = 0; i < _cardsSet[template]!; i++) {
        _cards.add(template.toDeckCard(i.toString()));
      }
    }
  }

  @override

  /// Shuffles the cards and returns it.
  Future<List<DeckCard>> fetch() {
    _cards.shuffle();
    return Future.value(_cards);
  }
}

/// Provides a template from which a deck card can be created.
/// It says "there are should be N cards of this face/reverse".
/// It is a responsibility of [CardsStore] to create deck from templates.
class _DeckCardTemplate {
  final CardKinds ego;
  final CardKinds alterEgo;
  _DeckCardTemplate.tuple(this.ego, this.alterEgo);
  _DeckCardTemplate.single(CardKinds ego) : this.tuple(ego, CardKinds.NONE);

  DeckCard toDeckCard(String surrogateId) {
    if (alterEgo == CardKinds.NONE) {
      return DeckCard(ego, surrogateId);
    } else {
      return TupleDeckCard(ego, alterEgo, surrogateId);
    }
  }
}
