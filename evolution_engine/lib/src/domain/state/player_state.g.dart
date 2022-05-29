// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerState _$PlayerStateFromJson(Map<String, dynamic> json) => PlayerState(
    (json['handsCards'] as List<dynamic>)
        .map((e) => CardState.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['animals'] as List<dynamic>)
        .map((e) => AnimalState.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['id'] as String));

Map<String, dynamic> _$PlayerStateToJson(PlayerState instance) =>
    <String, dynamic>{
      'handsCards': instance.handsCards,
      'animals': instance.animals,
      'id': instance.id,
    };
