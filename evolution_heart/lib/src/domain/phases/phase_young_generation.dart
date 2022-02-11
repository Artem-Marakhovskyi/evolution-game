import 'package:evolution_heart/src/domain/exceptions/cards_exception.dart';

import '../../../evolution_heart.dart';
import '../cards_deck.dart';

class PhaseYoungGeneration {
  final List<Player> _players;
  final CardsDeck _cardsStack;
  PhaseYoungGeneration(this._players, this._cardsStack);

  void pushCards() {
    if (_cardsStack.canTakeForPlayers(_players)) {
      for (var player in _players) {
        player.pushCards(_cardsStack.pop(player.cardsRequired));
      }
    } else {
      throw CardsException("There are no cards in the deck");
    }
  }
}
