// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameState _$GameStateFromJson(Map<String, dynamic> json) => GameState(
      json['currentRound'] as int,
      json['currentPhase'] as String,
      (json['playersOrder'] as List<dynamic>)
          .map((e) => PlayerState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameStateToJson(GameState instance) => <String, dynamic>{
      'currentRound': instance.currentRound,
      'currentPhase': instance.currentPhase,
      'playersOrder': instance.playersOrder,
    };
