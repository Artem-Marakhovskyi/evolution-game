import 'package:evolution_engine/src/domain/entities/cards/deck/card_kinds.dart';
import 'package:evolution_engine/src/domain/entities/cards_deck.dart';
import 'package:evolution_engine/src/domain/phases/phase_kind.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../evolution_engine.dart';
import 'animal_state.dart';
import 'card_state.dart';
import 'player_state.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState {
  final int currentRound;
  final PhaseKind currentPhase;
  late List<PlayerState> playersOrder;
  late List<CardState> deckLeftoverCards;
  late int cardsDeckOriginLength;
  late int cardsDeckCurrentLength;

  bool get isEmpty => playersOrder.length == 0;

  GameState.empty()
      : this.createFromJson(
            -1, PhaseKind.none, <PlayerState>[], <CardState>[], -1, -1);

  GameState.createFromJson(
      this.currentRound,
      this.currentPhase,
      this.playersOrder,
      this.deckLeftoverCards,
      this.cardsDeckOriginLength,
      this.cardsDeckCurrentLength);

  GameState(this.currentPhase, this.currentRound, List<Player> players,
      CardsDeck cardsDeck) {
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

      var playerState = PlayerState(cardStates, animalStates, player.id);
      playerStates.add(playerState);
      playersOrder = playerStates;

      deckLeftoverCards = cardsDeck.cards
          .map((e) => CardState(e.ego.stringified,
              e is TupleDeckCard ? e.alterEgo.stringified : '', e.id))
          .toList();
      cardsDeckOriginLength = cardsDeck.originLength;
      cardsDeckCurrentLength = cardsDeck.cards.length;
    }
  }

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  Map<String, dynamic> toJson() => _$GameStateToJson(this);
}
