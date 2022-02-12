import 'package:evolution_engine/src/stores/models/cards/attribute_card.dart';
import 'package:evolution_engine/src/stores/models/cards/card_kinds.dart';
import 'package:evolution_engine/src/stores/models/cards/deck_card.dart';

class AnimalCard {
  final DeckCard card;
  final List<AttributeCard> attrs = <AttributeCard>[];

  AnimalCard(this.card);

  get canSpawn => !attrs.any((attr) => attr.kind == CardKinds.R_STRATEGY);

  void addAttribute(AttributeCard attributeCard) {
    attrs.add(attributeCard);
  }
}
