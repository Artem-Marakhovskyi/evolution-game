import 'package:evolution_engine/src/domain/entities/cards/board/attribute_card.dart';
import 'package:evolution_engine/src/domain/entities/cards/deck/card_kinds.dart';
import 'package:json_annotation/json_annotation.dart';

part 'animal_state.g.dart';

@JsonSerializable()
class AnimalState {
  List<CardKinds> attrs;

  AnimalState(this.attrs);

  factory AnimalState.fromJson(Map<String, dynamic> json) =>
      _$AnimalStateFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalStateToJson(this);

  @override
  String toString() => attrs.map((e) => e.stringified).join(", ");
}
