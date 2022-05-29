import 'package:json_annotation/json_annotation.dart';

part 'animal_state.g.dart';

@JsonSerializable()
class AnimalState {
  List<String> attrs;

  AnimalState(this.attrs);

  factory AnimalState.fromJson(Map<String, dynamic> json) =>
      _$AnimalStateFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalStateToJson(this);
}
