import 'package:evolution_engine/src/stores/models/identifiable.dart';

import 'card_kinds.dart';

class DeckCard extends Identifiable {
  final CardKinds ego;
  final String surrogateId;

  DeckCard(this.ego, this.surrogateId);

  @override
  String get id => '$surrogateId.${ego.stringified}';
}
