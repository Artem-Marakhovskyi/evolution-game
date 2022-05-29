import 'package:get_it/get_it.dart';

import 'package:evolution_engine/evolution_engine.dart';

class ConsolePlayer extends Player {
  ConsolePlayer(String name, GetIt getIt) : super(name, getIt);

  @override
  bool get hasPassedThisRound => true;

  @override
  void playHandCard() {
    log.info("$name has been asked to play hand card");
  }

  @override
  void removeHungryAnimals() {
    // TODO: implement removeHungryAnimals
  }

  @override
  void spawnMandatoryAnimals() {
    // TODO: implement spawnMandatoryAnimals
  }
}
