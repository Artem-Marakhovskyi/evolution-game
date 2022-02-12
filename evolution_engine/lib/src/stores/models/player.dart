import 'package:evolution_engine/src/stores/models/animal_card.dart';
import 'package:evolution_engine/src/stores/models/identifiable.dart';
import 'package:evolution_engine/src/stores/models/deck_card.dart';

class Player extends Identifiable {
  static const int cardsToBePushedWhenEmpty = 6;

  @override
  String get id => name;

  final String name;

  Player(this.name);

  List<DeckCard> cards = <DeckCard>[];

  List<AnimalCard> animals = <AnimalCard>[];

  int get cardsRequired => animals.isEmpty
      ? cardsToBePushedWhenEmpty
      : animals.where((x) => x.canSpawn).length + 1;

  bool get hasPassedThisRound => false;

  void pushCards(DeckCard card) {
    cards.add(card);
  }

  void playHandCard() {}

  void removeHungryAnimals() {}

  void spawnMandatoryAnimals() {}
}
