import 'dart:math';

class Die extends Iterable<int> {
  static final Random _random = Random();
  final Iterator<int> _iterator;
  final int _count;

  Die([this._count = 1])
      : _iterator = _ValueIterator((idx) => _random.nextInt(6) + 1, _count);

  int get val => _random.nextInt(6) + 1;

  @override
  Iterator<int> get iterator => _iterator;
}

class DeterministicDie extends Die {
  final List<int> _values;
  final Iterator<int> _iterator;

  @override
  int get val {
    if (iterator.moveNext()) {
      return iterator.current;
    }

    return -1;
  }

  DeterministicDie(this._values)
      : _iterator = _ValueIterator((idx) => _values[idx], _values.length),
        super(_values.length);

  @override
  Iterator<int> get iterator => _iterator;
}

class _ValueIterator implements Iterator<int> {
  final int Function(int) _getValue;
  final int _count;
  int _val = 0;
  int _currentIdx = -1;

  _ValueIterator(this._getValue, this._count);

  @override
  int get current => _val;

  @override
  bool moveNext() {
    if (_currentIdx < _count - 1) {
      _val = _getValue(++_currentIdx);
      return true;
    } else {
      return false;
    }
  }
}
