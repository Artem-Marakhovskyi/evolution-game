import 'package:evolution_engine/src/domain/entities/cards/deck/card_kinds.dart';
import 'package:evolution_engine/src/domain/entities/cards/deck/deck_card.dart';

class AttributeCard {
  final DeckCard _deckCard;
  final CardKinds kind;
  final int extra;

  AttributeCard(this._deckCard, this.kind, this.extra);
}
