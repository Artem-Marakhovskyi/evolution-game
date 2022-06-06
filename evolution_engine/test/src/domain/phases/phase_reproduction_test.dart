import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/entities/cards/deck/card_kinds.dart';
import 'package:evolution_engine/src/domain/entities/cards/deck/deck_card.dart';
import 'package:evolution_engine/src/domain/entities/cards_deck.dart';
import 'package:evolution_engine/src/domain/phases/phase_reproduction.dart';
import 'package:evolution_engine/src/stores/models/player.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

import '../../../lib/src/stores/models/player_extension.dart';

void main() {
  group('Enough cards -> Animals spawned', () {
    test('', () {
      var cardsDeck = CardsDeck(<DeckCard>[
        DeckCard(CardKinds.BURROWING, "0"),
        DeckCard(CardKinds.CAMOUFLAGE, "0"),
        DeckCard(CardKinds.HOMEOTHERMY, "0"),
        DeckCard(CardKinds.GRAZING, "0"),
        DeckCard(CardKinds.COMMUNICATION, "0"),
        DeckCard(CardKinds.FAT_TISSUE, "0"),
      ]);

      var getIt = getConfiguredGetIt();
      var firstPlayer = _DumbPlayer("first", getIt);
      var secondPlayer = _DumbPlayer("seconds", getIt);

      firstPlayer.withUnorderedAnimals(1);
      secondPlayer.withUnorderedAnimals(2);

      var sut =
          PhaseReproduction([firstPlayer, secondPlayer], cardsDeck, Log());
      sut.perform();

      expect(firstPlayer.animals.length, 1);
      expect(secondPlayer.animals.length, 2);

      expect(firstPlayer.cards.length, 2);
      expect(secondPlayer.cards.length, 3);
    });
  });
}

GetIt getConfiguredGetIt() {
  GetIt.I.registerSingleton(Log());
  GetIt.I.registerSingleton(EventsService(Log()));
  return GetIt.I;
}

class _DumbPlayer extends Player {
  _DumbPlayer(String name, GetIt getIt) : super(name, getIt);

  @override
  bool get hasPassedThisRound => throw UnimplementedError();

  @override
  void playHandCard() {
    // TODO: implement playHandCard
  }

  @override
  void removeHungryAnimals() {
    // TODO: implement removeHungryAnimals
  }

  @override
  void spawnMandatoryAnimals() {}
}
