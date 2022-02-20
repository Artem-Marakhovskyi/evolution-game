import 'package:evolution_engine/evolution_engine.dart';

class ConsoleCardsStore extends CardsStore {
  @override
  Future<List<DeckCard>> fetch() {
    return Future.value(cards);
  }
}
