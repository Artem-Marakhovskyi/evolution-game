import 'package:evolution_engine/evolution_engine.dart';

class ConsolePlayer extends Player {
  ConsolePlayer(String name) : super(name);

  @override
  bool get hasPassedThisRound => throw UnimplementedError();

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
