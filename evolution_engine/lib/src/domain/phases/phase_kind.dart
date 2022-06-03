// ignore_for_file: constant_identifier_names

import 'package:evolution_engine/src/domain/entities/cards/deck/card_kinds.dart';

enum PhaseKind {
  REPRODUCTION,
  GROWTH,
  SUPPLY,
  FEEDING,
  EXTINCTION,

  NONE,
}

abstract class PhaseKindsFactory {
  static List<PhaseKind> fromDynamics(List<dynamic> objs) {
    return objs
        .map((obj) => PhaseKind.values
            .firstWhere((element) => element.stringified == obj.toString()))
        .toList();
  }

  static PhaseKind fromDynamic(dynamic obj) {
    return PhaseKind.values
        .firstWhere((element) => element.stringified == obj.toString());
  }
}
