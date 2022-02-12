import 'package:json_annotation/json_annotation.dart';

import 'player_state.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState {
  final int currentRound;
  final String currentPhase;
  final List<PlayerState> playersOrder;

  GameState(this.currentRound, this.currentPhase, this.playersOrder);

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  Map<String, dynamic> toJson() => _$GameStateToJson(this);
}
