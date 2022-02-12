import 'package:evolution_engine/src/stores/models/card_kinds.dart';

class AnimalCard {
  final List<CardKinds> attrs = <CardKinds>[];

  void addAttribute(CardKinds kind) {
    attrs.add(kind);
  }
}
