import 'package:evolution_engine/src/domain/entities/cards/deck/card_kinds.dart';
import 'package:evolution_engine/src/domain/entities/cards_deck.dart';
import 'package:evolution_engine/src/domain/phases/phase_kind.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../evolution_engine.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState {
  final int currentRound;
  final PhaseKind currentPhase;
  late List<PlayerState> playersOrder;
  late List<CardState> deckLeftoverCards;
  late int cardsDeckOriginLength;
  late int cardsDeckCurrentLength;

  bool get isEmpty => playersOrder.isEmpty;

  GameState.empty()
      : this.createFromJson(
            -1, PhaseKind.NONE, <PlayerState>[], <CardState>[], -1, -1);

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
        var cardState = CardState(card.ego,
            card is TupleDeckCard ? card.alterEgo : CardKinds.NONE, card.id);
        cardStates.add(cardState);
      }

      var animalStates = <AnimalState>[];
      for (var animal in player.animals) {
        var attrIds = List<CardKinds>.of(animal.attrs.map((e) => e.kind));
        var animalState = AnimalState(attrIds);
        animalStates.add(animalState);
      }

      var playerState = PlayerState(cardStates, animalStates, player.id);
      playerStates.add(playerState);
      playersOrder = playerStates;

      deckLeftoverCards = cardsDeck.cards
          .map((e) => CardState(
              e.ego, e is TupleDeckCard ? e.alterEgo : CardKinds.NONE, e.id))
          .toList();
      cardsDeckOriginLength = cardsDeck.originLength;
      cardsDeckCurrentLength = cardsDeck.cards.length;
    }
  }

  @override
  String toString() {
    var buffer = StringBuffer();
    buffer.writeln(
        "\nRound: $currentRound, Phase: ${currentPhase.stringified}, Cards in deck: $cardsDeckCurrentLength");

    for (var player in playersOrder) {
      buffer.writeln(
          "${getIndent()}Player ${player.id}, hand: ${player.handsCards.length}, animals: ${player.animals.length}");
      buffer.write("${getIndent(2)}Hand cards: ");

      int handCardCount = 1;
      for (var handCard in player.handsCards) {
        var write = handCardCount % 3 == 0 ? buffer.writeln : buffer.write;
        var addition =
            handCardCount % 3 == 1 && handCardCount > 1 ? getIndent(3) : "";
        write(
            "$addition${handCard.ego.stringified}${handCard.alterEgo == CardKinds.NONE ? "" : "/" + handCard.alterEgo.stringified},");
        handCardCount++;
      }

      if (player.animals.isNotEmpty) {
        buffer.write("${getIndent(2)}Animals cards: \n");
        for (var animal in player.animals) {
          buffer.writeln(
              "${getIndent(3)}${animal.attrs.map((e) => e.stringified).join(', ')}");
        }
      }
    }
    return buffer.toString();
  }

  String getIndent([int count = 1]) => '  ' * count;

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  Map<String, dynamic> toJson() => _$GameStateToJson(this);
}
