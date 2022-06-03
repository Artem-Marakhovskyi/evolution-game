import 'package:evolution_engine/src/domain/phases/phase_kind.dart';

class GameConfig {
  PhaseKind phaseToPlayUntil;
  int roundToPlayUntil;
  GameConfig(this.roundToPlayUntil, this.phaseToPlayUntil);
  GameConfig.empty()
      : phaseToPlayUntil = PhaseKind.NONE,
        roundToPlayUntil = -1;
}
