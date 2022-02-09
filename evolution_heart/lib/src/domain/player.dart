import 'package:evolution_heart/src/domain/entities/identifiable.dart';

import 'entities/cards/card.dart';

class Player extends Identifiable {
  static const int cardsToBePushedWhenEmpty = 6;

  @override
  String get id => name;

  final String name;

  Player(this.name);

  List<Card> cards = <Card>[];

  int get cardsRequired =>
      cards.isEmpty ? cardsToBePushedWhenEmpty : cards.length + 1;
}
