import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/exceptions/cards_exception.dart';

import '../../../evolution_engine.dart';
import '../cards_deck.dart';
import 'phase.dart';

class PhaseYoungGeneration extends Phase {
  final List<Player> _players;
  final CardsDeck _cardsStack;
  PhaseYoungGeneration(this._players, this._cardsStack, Log log)
      : super(log, 'Young Generation');

  Future perform() async {
    verbose('started');
    if (_cardsStack.canTakeForPlayers(_players)) {
      for (var player in _players) {
        var cards = _cardsStack.pop(player.cardsRequired);
        player.pushCards(cards);
        verbose('pushed ${cards.map((c) => c.id)} to ${player.name}');
        player.spawnMandatoryAnimals();
        verbose('player ${player.name} spawned mandatory animals (if any)');
      }
    } else {
      verbose('cannot complete -> CardsException');
      throw CardsException("There are no cards in the deck");
    }

    verbose('completed');
  }
}
