import 'dart:io';

import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';

import '../../io/console_input_reader.dart';

class ConsolePlayer extends Player {
  final ConsoleInputReader _inputReader;

  ConsolePlayer(
      String name, ConsoleInputReader inputReader, EventsService eventsService)
      : _inputReader = inputReader,
        super(name, eventsService);

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
