import 'cards/card.dart';

class Player {
  static const int cardsToBePushedWhenEmpty = 6;

  final String name;

  Player(this.name);

  List<Card> cards = <Card>[];

  int get cardsRequired =>
      cards.length == 0 ? cardsToBePushedWhenEmpty : cards.length + 1;
}
