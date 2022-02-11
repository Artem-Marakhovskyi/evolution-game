import '../player.dart';
import 'store.dart';

class PlayersStore implements Store<Player> {
  final List<Player> _players = <Player>[Player('_a_'), Player('_b_')];

  @override
  Future<List<Player>> fetch() {
    return Future.value(_players);
  }
}
