// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalState _$AnimalStateFromJson(Map<String, dynamic> json) => AnimalState(
      (json['attrs'] as List<dynamic>)
          .map(
            (e) => CardKinds.values
                .firstWhere((element) => element.stringified == e.toString()),
          )
          .toList(),
    );

Map<String, dynamic> _$AnimalStateToJson(AnimalState instance) =>
    <String, dynamic>{
      'attrs': instance.attrs,
    };
