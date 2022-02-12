import 'package:evolution_engine/src/stores/models/cards/animal_card.dart';
import 'package:evolution_engine/src/stores/models/identifiable.dart';
import 'package:evolution_engine/src/stores/models/cards/deck_card.dart';

abstract class Player extends Identifiable {
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

  bool get hasPassedThisRound;

  void pushCards(List<DeckCard> card) {
    cards.addAll(card);
  }

  void playHandCard();

  void removeHungryAnimals();

  void spawnMandatoryAnimals();
}
