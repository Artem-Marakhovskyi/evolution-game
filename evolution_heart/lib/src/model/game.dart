import 'package:evolution_heart/src/model/cards_stack.dart';

import 'player.dart';

class Game {
  final List<Player> _players;
  final EventsService _eventsService;
  late final CardsStack _cardsStack;

  Game(this.players, this.eventsService);
}
