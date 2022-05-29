import '../../evolution_engine.dart';

class ScoresCalculator {
  final List<Player> _players;
  ScoresCalculator(this._players);

  Map<Player, int> calculate() {
    var scoreTable = <Player, int>{};
    for (var player in _players) {
      var score = 0;
      for (var animal in player.animals) {
        score++;
        for (var attr in animal.attrs) {
          score++;
          score += attr.extra;
        }
      }
      scoreTable[player] = score;
    }

    return scoreTable;
  }
}
