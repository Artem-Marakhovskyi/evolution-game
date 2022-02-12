import 'package:cross_cutting/cross_cutting.dart';

abstract class Phase {
  final Log log;
  final String phaseName;
  Phase(this.log, this.phaseName);

  verbose(String message) {
    log.verbose('$phaseName: $message');
  }
}
