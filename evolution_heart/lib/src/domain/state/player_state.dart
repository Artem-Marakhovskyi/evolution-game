import 'package:json_annotation/json_annotation.dart';

import 'animal_state.dart';
import 'hand_card_state.dart';

part 'player_state.g.dart';

@JsonSerializable()
class PlayerState {
  final List<String> animalsOrder;
  final List<HandCardState> handsCards;
  final List<AnimalState> animals;
}
