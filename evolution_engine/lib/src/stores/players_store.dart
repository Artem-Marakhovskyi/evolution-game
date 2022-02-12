import '../../evolution_engine.dart';
import 'store.dart';

class PlayersStore implements Store<Player> {
  final List<Player> _players;

  PlayersStore(this._players);

  @override
  Future<List<Player>> fetch() {
    return Future.value(_players);
  }
}
