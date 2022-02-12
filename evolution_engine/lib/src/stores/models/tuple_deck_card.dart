import 'card_kinds.dart';
import 'deck_card.dart';

class TupleDeckCard extends DeckCard {
  final CardKinds alterEgo;
  TupleDeckCard(CardKinds ego, this.alterEgo) : super(ego);
}
