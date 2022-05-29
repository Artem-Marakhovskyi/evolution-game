import 'package:evolution_engine/src/domain/state/game_state.dart';

abstract class OutputWriter {
  Future write(GameState gameState);
}
