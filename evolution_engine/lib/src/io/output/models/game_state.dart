import 'package:json_annotation/json_annotation.dart';

import 'player_state.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState {
  final int currentRound;
  final String currentPhase;
  final List<PlayerState> playersOrder;
  final int cardsDeckOriginLength;
  final int cardsDeckCurrentLength;
  GameState(this.currentRound, this.currentPhase, this.playersOrder,
      this.cardsDeckOriginLength, this.cardsDeckCurrentLength);

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  Map<String, dynamic> toJson() => _$GameStateToJson(this);
}
