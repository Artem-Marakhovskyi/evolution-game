import 'card_kinds.dart';
import 'single_card.dart';

class TupleComposite extends SingleCard {
  final CardKinds alterEgo;
  TupleComposite(CardKinds ego, this.alterEgo) : super(ego);
}
