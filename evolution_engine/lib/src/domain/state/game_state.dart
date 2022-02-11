import 'package:json_annotation/json_annotation.dart';

import 'player_state.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState {
  final int currentRound;
  final String currentPhase;

  final List<PlayerState> playersOrder;

  GameState({this.dateOfBirth});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GameStateToJson(this);
}
