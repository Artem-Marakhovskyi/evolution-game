import 'package:evolution_engine/src/io/input/models/feeding_animal_fed.dart';
import 'package:evolution_engine/src/io/input/models/input_data.dart';
import 'package:evolution_engine/src/io/output/models/game_state.dart';

abstract class InputReader {
  Future<InputData> read(GameState gameState);
}
