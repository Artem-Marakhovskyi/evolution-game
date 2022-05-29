import 'dart:io';

import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';

import '../../io/console_input_reader.dart';

class ConsolePlayer extends Player {
  final ConsoleInputReader _inputReader;
  final Log _log;

  ConsolePlayer(String name, ConsoleInputReader inputReader,
      EventsService eventsService, this._log)
      : _inputReader = inputReader,
        super(name, eventsService);

  @override
  bool get hasPassedThisRound => false;

  @override
  void playHandCard() {
    _log.info("${this.name} has been asked to play hand card");
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
