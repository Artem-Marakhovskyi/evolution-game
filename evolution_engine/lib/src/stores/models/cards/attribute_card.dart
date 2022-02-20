import 'package:evolution_engine/evolution_engine.dart';
import 'package:evolution_engine/src/stores/models/cards/card_kinds.dart';

class AttributeCard {
  final DeckCard _deckCard;
  final CardKinds kind;
  final int extra;

  AttributeCard(this._deckCard, this.kind, this.extra);
}
