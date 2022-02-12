import 'package:evolution_engine/src/domain/phases/round.dart';
import 'package:evolution_engine/src/stores/cards_store.dart';
import 'package:evolution_engine/src/stores/players_store.dart';
import 'package:get_it/get_it.dart';

import '../../evolution_engine.dart';
import '../bootstrap/ambient_context.dart';
import 'cards_deck.dart';
import 'die.dart';

class Game {
  late final PlayersStore _playersStore;
  late final AmbientContext _ambientContext;
  late final CardsStore _cardsStore;
  late final CardsDeck _cardsDeck;
  late final Die _die;
  final List<Player> _players = <Player>[];

  Game(DependenciesExternalModule? dependenciesExternalModule) {
    var _ = DependenciesRegistry(dependenciesExternalModule);

    _die = GetIt.I.get<Die>();
    _ambientContext = GetIt.I.get<AmbientContext>();
    _playersStore = GetIt.I.get<PlayersStore>();
    _cardsStore = GetIt.I.get<CardsStore>();
  }

  Future prepare() async {
    _cardsDeck = CardsDeck(await _cardsStore.fetch());
    _players.addAll(await _playersStore.fetch());
  }

  Future start() {
    while (_cardsDeck.canTakeForPlayers(_players)) {
      var roundConfiguration = _createConfiguration();
      Round(_players, _cardsDeck, _ambientContext, _die).play();
    }

    return Future.delayed(Duration.zero, () => null);
  }

  _createConfiguration() {}
}
