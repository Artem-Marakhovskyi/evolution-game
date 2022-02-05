import 'package:cross_cutting/cross_cutting.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = CrossCutting();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
