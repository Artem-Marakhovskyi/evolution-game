import 'package:json_annotation/json_annotation.dart';

part 'card_state.g.dart';

@JsonSerializable()
class CardState {
  String ego;
  String alterEgo;
  String surrogate;

  factory CardState.fromString(String key) {
    var splits = key.split('.');
    return CardState(splits[1], splits.length > 2 ? splits[2] : '', splits[0]);
  }

  CardState(this.ego, this.alterEgo, this.surrogate);

  factory CardState.fromJson(Map<String, dynamic> json) =>
      _$CardStateFromJson(json);

  Map<String, dynamic> toJson() => _$CardStateToJson(this);
}
