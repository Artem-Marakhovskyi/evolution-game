import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/entities/cards/board/animal_card.dart';
import 'package:evolution_engine/src/stores/models/identifiable.dart';
import 'package:get_it/get_it.dart';

import '../../../evolution_engine.dart';

abstract class Player extends Identifiable {
  static const int cardsToBePushedWhenEmpty = 6;

  final EventsService eventsService;
  final Log log;
  final String name;

  @override
  String get id => name;

  Player(this.name, GetIt getIt)
      : eventsService = getIt.get<EventsService>(),
        log = getIt.get<Log>();

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
