import 'package:up_menus/up_menus.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = UPMenus();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
