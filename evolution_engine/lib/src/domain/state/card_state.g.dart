// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardState _$CardStateFromJson(Map<String, dynamic> json) => CardState(
      json['ego'] as String,
      json['alterEgo'] as String,
      json['surrogate'] as String,
    );

Map<String, dynamic> _$CardStateToJson(CardState instance) => <String, dynamic>{
      'ego': instance.ego,
      'alterEgo': instance.alterEgo,
      'surrogate': instance.surrogate,
    };
