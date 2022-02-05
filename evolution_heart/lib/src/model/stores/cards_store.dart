import '../cards/card.dart';

class CardsStore {
  List<Card> _cards = [];

  CardsStore() {
    _cards = [Card(), Card(), Card()];
  }

  Future<List<Card>> fetchCards() {
    return Future.value(_cards);
  }
}
