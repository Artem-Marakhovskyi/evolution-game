import 'package:json_annotation/json_annotation.dart';

import 'animal_state.dart';
import 'card_state.dart';

part 'player_state.g.dart';

@JsonSerializable()
class PlayerState {
  final List<CardState> handsCards;
  final List<AnimalState> animals;

  PlayerState(this.handsCards, this.animals);

  factory PlayerState.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStateToJson(this);
}
