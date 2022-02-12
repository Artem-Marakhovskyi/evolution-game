import 'die.dart';

class Feeder {
  static const Map<int, _FeederInitRule> _feederInitRules = {
    2: _FeederInitRule(1, 2),
    3: _FeederInitRule(2, 0),
    4: _FeederInitRule(2, 2),
    5: _FeederInitRule(3, 2),
    6: _FeederInitRule(3, 3),
    7: _FeederInitRule(4, 2),
    8: _FeederInitRule(4, 4),
  };

  int _currentFoodCount = 0;

  get foodCount => _currentFoodCount;

  Feeder.fromPlayers(Die die, int count) {
    final rule = _feederInitRules[count]!;
    _currentFoodCount = rule.extraCount;
    for (var i = 0; i < rule.dieCount; i++) {
      _currentFoodCount += die.val;
    }
  }

  void grab(int amount) => _currentFoodCount -= amount;

  bool canGrab(int amount) => _currentFoodCount >= amount;
}

class _FeederInitRule {
  final int dieCount;
  final int extraCount;

  const _FeederInitRule(this.dieCount, this.extraCount);
}
