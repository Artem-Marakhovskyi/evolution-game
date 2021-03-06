// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameState _$GameStateFromJson(Map<String, dynamic> json) =>
    GameState.createFromJson(
        json['currentRound'] as int,
        PhaseKindsFactory.fromDynamic(json['currentPhase']),
        (json['playersOrder'] as List<dynamic>)
            .map((e) => PlayerState.fromJson(e as Map<String, dynamic>))
            .toList(),
        (json['deckLeftoverCards'] as List<dynamic>)
            .map((e) => CardState.fromJson(e as Map<String, dynamic>))
            .toList(),
        json['cardsDeckOriginLength'] as int,
        json['cardsDeckCurrentLength'] as int);

Map<String, dynamic> _$GameStateToJson(GameState instance) => <String, dynamic>{
      'currentRound': instance.currentRound,
      'currentPhase': instance.currentPhase.stringified,
      'playersOrder': instance.playersOrder,
      'deckLeftoverCards': instance.deckLeftoverCards,
      'cardsDeckOriginLength': instance.cardsDeckOriginLength,
      'cardsDeckCurrentLength': instance.cardsDeckCurrentLength
    };
