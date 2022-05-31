import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/phases/phase_kind.dart';

abstract class Phase {
  final Log log;
  final PhaseKind phaseKind;
  Phase(this.log, this.phaseKind);

  verbose(String message) {
    log.verbose('$phaseKind: $message');
  }
}
