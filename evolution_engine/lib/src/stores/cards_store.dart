import 'models/card_kinds.dart';
import 'models/deck_card.dart';
import 'models/tuple_deck_card.dart';

class CardsStore {
  final Map<DeckCard, int> _cardsSet = <DeckCard, int>{
    DeckCard(CardKinds.CAMOUFLAGE): 4,
    DeckCard(CardKinds.BURROWING): 4,
    DeckCard(CardKinds.SHARP_VISION): 4,
    DeckCard(CardKinds.SYMBIOSIS): 4,
    DeckCard(CardKinds.PIRACY): 4,
    DeckCard(CardKinds.GRAZING): 4,
    DeckCard(CardKinds.TAIL_LOSS): 4,
    DeckCard(CardKinds.HIBERNATION_ABILITY): 4,
    DeckCard(CardKinds.POISONOUS): 4,
    DeckCard(CardKinds.COMMUNICATION): 4,
    DeckCard(CardKinds.SCAVENGER): 4,
    DeckCard(CardKinds.RUNNING): 4,
    DeckCard(CardKinds.MIMICRY): 4,
    DeckCard(CardKinds.SWIMMING): 8,
    TupleDeckCard(CardKinds.PARASITE, CardKinds.CARNIVOROUS): 4,
    TupleDeckCard(CardKinds.PARASITE, CardKinds.FAT_TISSUE): 4,
    TupleDeckCard(CardKinds.COOPERATION, CardKinds.CARNIVOROUS): 4,
    TupleDeckCard(CardKinds.COOPERATION, CardKinds.FAT_TISSUE): 4,
    TupleDeckCard(CardKinds.HIGH_BODY_WEIGHT, CardKinds.CARNIVOROUS): 4,
    TupleDeckCard(CardKinds.HIGH_BODY_WEIGHT, CardKinds.FAT_TISSUE): 4,
    DeckCard(CardKinds.FLIGHTY): 4,
    DeckCard(CardKinds.HOMEOTHERMY): 4,
    DeckCard(CardKinds.R_STRATEGY): 4,
  };

  List<DeckCard> _cards = [];

  CardsStore() {
    for (var anyCard in _cardsSet.keys) {}
  }

  Future<List<DeckCard>> fetch() {
    return Future.value(_cards);
  }
}
