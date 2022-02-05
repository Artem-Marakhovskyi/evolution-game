import 'package:evolution_heart/evolution_heart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Heart();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
