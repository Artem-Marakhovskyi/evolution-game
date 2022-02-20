import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/stores/models/cards/animal_card.dart';
import 'package:evolution_engine/src/stores/models/identifiable.dart';
import 'package:evolution_engine/src/stores/models/cards/deck_card.dart';

abstract class Player extends Identifiable {
  static const int cardsToBePushedWhenEmpty = 6;

  final EventsService eventsService;
  final String name;

  @override
  String get id => name;

  Player(this.name, this.eventsService);

  List<DeckCard> cards = <DeckCard>[];

  List<AnimalCard> animals = <AnimalCard>[];

  int get cardsRequired => animals.isEmpty
      ? cardsToBePushedWhenEmpty
      : animals.where((x) => x.canSpawn).length + 1;

  bool get hasPassedThisRound;

  void pushCards(List<DeckCard> card) {
    cards.addAll(card);
    eventsService.raise("received_cards", {
      "player": id,
      "cards_total_count": cards.length.toString(),
      "cards": cards.map((card) => card.id).join(","),
      "animals": animals.map((animal) => animal.toString()).join('\n')
    });
  }

  void playHandCard();

  void removeHungryAnimals();

  void spawnMandatoryAnimals();
}
