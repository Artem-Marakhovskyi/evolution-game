import 'package:evolution_engine/src/domain/entities/cards/deck/card_kinds.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../evolution_engine.dart';

part 'card_state.g.dart';

@JsonSerializable()
class CardState {
  CardKinds ego;
  CardKinds alterEgo;
  String surrogate;

  CardState(this.ego, this.alterEgo, this.surrogate);

  factory CardState.fromJson(Map<String, dynamic> json) =>
      _$CardStateFromJson(json);

  Map<String, dynamic> toJson() => _$CardStateToJson(this);

  @override
  String toString() => TupleDeckCard(ego, alterEgo, surrogate).id;
}
