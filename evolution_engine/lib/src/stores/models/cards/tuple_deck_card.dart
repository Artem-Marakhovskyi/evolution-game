import 'card_kinds.dart';
import 'deck_card.dart';

class TupleDeckCard extends DeckCard {
  final CardKinds alterEgo;
  TupleDeckCard(CardKinds ego, this.alterEgo, String surrogateId)
      : super(ego, surrogateId);

  @override
  String get id => '${super.id}.$alterEgo';
}
