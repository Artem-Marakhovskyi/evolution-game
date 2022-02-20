import 'package:json_annotation/json_annotation.dart';

part 'card_state.g.dart';

@JsonSerializable()
class CardState {
  String ego;
  String alterEgo;
  String id;

  CardState(this.ego, this.alterEgo, this.id);

  factory CardState.fromJson(Map<String, dynamic> json) =>
      _$CardStateFromJson(json);

  Map<String, dynamic> toJson() => _$CardStateToJson(this);
}
