import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';

class ConsolePlayer extends Player {
  ConsolePlayer(String name, EventsService eventsService)
      : super(name, eventsService);

  @override
  bool get hasPassedThisRound => true;

  @override
  void playHandCard() {}

  @override
  void removeHungryAnimals() {
    // TODO: implement removeHungryAnimals
  }

  @override
  void spawnMandatoryAnimals() {
    // TODO: implement spawnMandatoryAnimals
  }
}
