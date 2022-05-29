import 'package:evolution_engine/src/domain/entities/die.dart';

import 'package:test/test.dart';

void main() {
  group('die_test', () {
    void expectRandom(int expectedCount) {
      var die = Die(expectedCount);
      var actual = [];
      for (var x in die) {
        actual.add(x);
      }

      expect(actual.length, expectedCount);
      expect(actual.every((element) => element > 0 && element < 7), isTrue);
    }

    test('several values', () {
      expectRandom(10);
    });

    test('one value', () {
      expectRandom(1);
    });

    test('zero values', () {
      expectRandom(0);
    });
  });

  group('deterministic_die_test', () {
    void expectDeterministicForeach(List<int> expected) {
      var die = DeterministicDie(expected);
      var actual = [];
      for (var x in die) {
        actual.add(x);
      }
      expect(actual, expected);
    }

    void expectDeterministicRepeatedlyCalling(List<int> expected) {
      var die = DeterministicDie(expected);
      var actual = [];
      var returned = -1;
      do {
        returned = die.val;
        if (returned != -1) {
          actual.add(returned);
        }
      } while (returned != -1);
      expect(actual, expected);
    }

    test('several value - a lot',
        () => expectDeterministicForeach([1, 2, 3, 4, 5, 6, 1, 2, 3, 5]));
    test('several value - few', () => expectDeterministicForeach([82, 8, 1]));
    test('one value', () => expectDeterministicForeach([82]));
    test('no values', () => expectDeterministicForeach([]));

    test(
        '(repeatedly callint) several value - a lot',
        () => expectDeterministicRepeatedlyCalling(
            [1, 2, 3, 4, 5, 6, 1, 2, 3, 5]));
    test('(repeatedly callint) several value - few',
        () => expectDeterministicRepeatedlyCalling([82, 8, 1]));
    test('(repeatedly callint) one value',
        () => expectDeterministicRepeatedlyCalling([82]));
    test('(repeatedly callint) no values',
        () => expectDeterministicRepeatedlyCalling([]));
  });
}
