// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardState _$CardStateFromJson(Map<String, dynamic> json) => CardState(
      CardKindsFactory.fromDynamic(json['ego']),
      CardKindsFactory.fromDynamic(json['alterEgo']),
      json['surrogate'] as String,
    );

Map<String, dynamic> _$CardStateToJson(CardState instance) => <String, dynamic>{
      'ego': instance.ego,
      'alterEgo': instance.alterEgo,
      'surrogate': instance.surrogate,
    };
