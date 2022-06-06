import 'package:evolution_engine/evolution_engine.dart';
import 'package:evolution_engine/src/domain/entities/cards/board/animal_card.dart';
import 'package:evolution_engine/src/domain/entities/cards/deck/card_kinds.dart';

extension PlayerExtension on Player {
  Player withHandCards(List<CardKinds> cardKinds) {
    pushCards(cardKinds.map((e) => DeckCard(e, "0")).toList());

    return this;
  }

  Player withUnorderedAnimals(int animalsCount) {
    for (var i = 0; i < animalsCount; i++) {
      animals.add(AnimalCard(DeckCard(CardKinds.NONE, "0")));
    }

    return this;
  }
}
