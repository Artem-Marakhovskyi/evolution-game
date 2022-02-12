import 'package:evolution_engine/src/domain/exceptions/cards_exception.dart';

import '../../../evolution_engine.dart';
import '../cards_deck.dart';
import 'phase.dart';

class PhaseYoungGeneration extends Phase {
  final List<Player> _players;
  final CardsDeck _cardsStack;
  PhaseYoungGeneration(this._players, this._cardsStack);

  Future perform() async {
    if (_cardsStack.canTakeForPlayers(_players)) {
      for (var player in _players) {
        var card = _cardsStack.pop(player.cardsRequired);
        player.pushCards(card);
        player.spawnMandatoryAnimals();
      }
    } else {
      throw CardsException("There are no cards in the deck");
    }
  }
}
