import 'dart:collection';

import '../../evolution_engine.dart';
import 'store.dart';
import '../domain/entities/cards/deck/card_kinds.dart';

class CardsStore extends Store<DeckCard> {
  final List<DeckCard> _cards = [];

  List<DeckCard> get cards => UnmodifiableListView(_cards);

  CardsStore() {
    var setTemplate = _DeckCardTemplateSet().cardsSet;
    for (var template in setTemplate.keys) {
      for (var i = 0; i < setTemplate[template]!; i++) {
        _cards.add(template.toDeckCard(i.toString()));
      }
    }
    _cards.shuffle();
  }

  @override
  Future<List<DeckCard>> fetch() => Future.value(_cards);
}

class _DeckCardTemplateSet {
  final Map<_DeckCardTemplate, int> cardsSet = <_DeckCardTemplate, int>{
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
