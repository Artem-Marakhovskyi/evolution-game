import 'package:evolution_engine/src/domain/state/game_state.dart';
import 'package:evolution_engine/src/io/input/models/input_data.dart';

abstract class InputReader {
  Future<InputData> read(GameState gameState);
}
