import 'package:evolution_engine/src/stores/models/attribute_card.dart';
import 'package:evolution_engine/src/stores/models/card_kinds.dart';
import 'package:evolution_engine/src/stores/models/single_card.dart';

class AnimalCard {
  final SingleCard card;
  final List<AttributeCard> attrs = <AttributeCard>[];

  AnimalCard(this.card);

  get canSpawn => !attrs.any((attr) => attr.kind == CardKinds.R_STRATEGY);

  void addAttribute(AttributeCard attributeCard) {
    attrs.add(attributeCard);
  }
}
