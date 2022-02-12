import 'package:cross_cutting/cross_cutting.dart';
import 'models/game_state.dart';

abstract class OutputWriter {
  Future write(GameState gameState);
}
