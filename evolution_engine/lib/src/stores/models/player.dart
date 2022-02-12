import 'package:evolution_engine/src/stores/models/identifiable.dart';
import 'package:evolution_engine/src/stores/models/single_card.dart';

class Player extends Identifiable {
  static const int cardsToBePushedWhenEmpty = 6;

  @override
  String get id => name;

  final String name;

  Player(this.name);

  List<SingleCard> cards = <SingleCard>[];

  int get cardsRequired =>
      cards.isEmpty ? cardsToBePushedWhenEmpty : cards.length + 1;

  void pushCards(SingleCard? pop) {}
}
