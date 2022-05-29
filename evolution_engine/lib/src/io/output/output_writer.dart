import 'models/game_state.dart';

abstract class OutputWriter {
  Future write(GameState gameState);
}
