import '../../stores/models/cards/card_kinds.dart';
import '../../domain/cards_deck.dart';
import '../../../evolution_engine.dart';
import 'models/animal_state.dart';
import 'models/card_state.dart';
import 'models/game_state.dart';
import 'models/player_state.dart';

void writeState(OutputWriter outputWriter, String phase, int currentRoundIdx,
    List<Player> players, CardsDeck cardsDeck) {
  var playerStates = <PlayerState>[];
  for (var player in players) {
    var cardStates = <CardState>[];
    for (var card in player.cards) {
      var cardState = CardState(card.ego.stringified,
          card is TupleDeckCard ? card.alterEgo.stringified : "", card.id);
      cardStates.add(cardState);
    }

    var animalStates = <AnimalState>[];
    for (var animal in player.animals) {
      var attrIds =
          List<String>.of(animal.attrs.map((e) => e.kind.stringified));
      var animalState = AnimalState(attrIds);
      animalStates.add(animalState);
    }

    var playerState = PlayerState(cardStates, animalStates);
    playerStates.add(playerState);
  }

  var gameState = GameState(currentRoundIdx, phase, playerStates,
      cardsDeck.originLength, cardsDeck.length);

  outputWriter.write(gameState);
}
