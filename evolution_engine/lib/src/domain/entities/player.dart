import 'package:evolution_engine/src/domain/entities/cards/board/animal_card.dart';
import 'package:evolution_engine/src/stores/models/identifiable.dart';
import 'cards/card.dart';

class Player {
  static const int cardsToBePushedWhenEmpty = 6;

  final String name;

  Player(this.name);

  List<Card> _handCards = <Card>[];

  List<AnimalCard> animals = <AnimalCard>[];

  int get cardsRequired =>
      animals.isEmpty ? cardsToBePushedWhenEmpty : animals.length + 1;

  void pushCards(Card card) {
    _handCards.add(card);
  }
}
