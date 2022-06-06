import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/exceptions/cards_exception.dart';

import '../../../evolution_engine.dart';
import '../entities/cards_deck.dart';
import 'phase.dart';
import 'phase_kind.dart';

/// Input: Players, card stack
/// Processing: Give to player as many cards as required.
///     Player puts them into hand.
class PhaseReproduction extends Phase {
  final List<Player> _players;
  final CardsDeck _cardsDeck;
  PhaseReproduction(this._players, this._cardsDeck, Log log)
      : super(log, PhaseKind.REPRODUCTION);

  Future perform() async {
    verbose('started');
    if (_cardsDeck.canTakeForPlayers(_players)) {
      for (var player in _players) {
        var cards = _cardsDeck.pop(player.cardsRequired);
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
