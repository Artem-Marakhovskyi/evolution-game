import 'models/card_kinds.dart';
import 'models/single_card.dart';
import 'models/tuple_card.dart';

class CardsStore {
  final Map<SingleCard, int> _cardsSet = <SingleCard, int>{
    SingleCard(CardKinds.CAMOUFLAGE): 4,
    SingleCard(CardKinds.BURROWING): 4,
    SingleCard(CardKinds.SHARP_VISION): 4,
    SingleCard(CardKinds.SYMBIOSIS): 4,
    SingleCard(CardKinds.PIRACY): 4,
    SingleCard(CardKinds.GRAZING): 4,
    SingleCard(CardKinds.TAIL_LOSS): 4,
    SingleCard(CardKinds.HIBERNATION_ABILITY): 4,
    SingleCard(CardKinds.POISONOUS): 4,
    SingleCard(CardKinds.COMMUNICATION): 4,
    SingleCard(CardKinds.SCAVENGER): 4,
    SingleCard(CardKinds.RUNNING): 4,
    SingleCard(CardKinds.MIMICRY): 4,
    SingleCard(CardKinds.SWIMMING): 8,
    TupleComposite(CardKinds.PARASITE, CardKinds.CARNIVOROUS): 4,
    TupleComposite(CardKinds.PARASITE, CardKinds.FAT_TISSUE): 4,
    TupleComposite(CardKinds.COOPERATION, CardKinds.CARNIVOROUS): 4,
    TupleComposite(CardKinds.COOPERATION, CardKinds.FAT_TISSUE): 4,
    TupleComposite(CardKinds.HIGH_BODY_WEIGHT, CardKinds.CARNIVOROUS): 4,
    TupleComposite(CardKinds.HIGH_BODY_WEIGHT, CardKinds.FAT_TISSUE): 4,
    SingleCard(CardKinds.FLIGHTY): 4,
    SingleCard(CardKinds.HOMEOTHERMY): 4,
    SingleCard(CardKinds.R_STRATEGY): 4,
  };

  List<SingleCard> _cards = [];

  CardsStore() {
    _cards = [];
  }

  Future<List<SingleCard>> fetch() {
    return Future.value(_cards);
  }
}
