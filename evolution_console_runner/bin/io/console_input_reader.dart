import 'dart:io';
import 'package:evolution_engine/src/domain/state/game_state.dart';
import 'package:evolution_engine/evolution_engine.dart';

class ConsoleInputReader extends InputReader {
  @override
  Future<InputData> read(GameState gameState) {
    String? line;
    do {
      stdout.writeln('Please enter:');
      line = stdin.readLineSync(retainNewlines: false);
    } while (line == null || line.isEmpty);

    // TODO fix stub
    var inputData = FeedingAnimalFed();

    return Future.value(inputData);
  }
}
