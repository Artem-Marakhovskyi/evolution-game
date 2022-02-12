import 'package:evolution_engine/src/stores/models/identifiable.dart';

import 'card_kinds.dart';

class DeckCard extends Identifiable {
  final CardKinds ego;
  final String _surrogateId;

  DeckCard(this.ego, this._surrogateId);

  @override
  String get id => '$_surrogateId.$ego';
}
