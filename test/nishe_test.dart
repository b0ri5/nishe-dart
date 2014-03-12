import 'package:unittest/unittest.dart';
import 'package:nishe-dart/nishe.dart';

void main() {
  group('Partition', () {
    group('#fromLists', () {
      test('makes sense for empty partition', () {
        expect(new Partition([]).domain, isEmpty);
      });
    });
    group('#image', () {
      test('matches input', () {
        expect(new Partition([['a']]).image('a'), equals('a'));
        expect(new Partition([['b']]).image('b'), equals('b'));

        var p1 = new Partition([['a', 'b']]);
        expect(p1.image('a'), equals('a'));
        expect(p1.image('b'), equals('a'));

        var p2 = new Partition([['a'], ['b']]);
        expect(p2.image('a'), equals('a'));
        expect(p2.image('b'), equals('b'));
      });
      test('malformed input', () {
        expect(() => new Partition([[]]), throwsArgumentError);
        expect(() => new Partition([['a'], []]), throwsArgumentError);
        expect(() => new Partition([['a'], ['a']]), throwsArgumentError);
        expect(() => new Partition([['a', 'a']]), throwsArgumentError);
      });
      test('modifications do not modify partition', () {
        var list = [['a']];
        var p = new Partition(list);
        list[0][0] = 'b';
        expect(p.image('a'), equals('a'));
        expect(p.domain, equals(['a']));
      });
    });
    group('#domain', () {
      test('matches input', () {
        expect(new Partition([['a']]).domain, equals(['a']));
        expect(new Partition([['b']]).domain, equals(['b']));
        expect(new Partition([['a', 'b']]).domain, equals(['a', 'b']));
        expect(new Partition([['b', 'a']]).domain, equals(['a', 'b']));
        expect(new Partition([['a'], ['b']]).domain, equals(['a', 'b']));
        expect(new Partition([['b'], ['a']]).domain, equals(['a', 'b']));
      });
      test('modifications do not affect partition', () {
        var p = new Partition([['a']]);
        var domain = p.domain;
        domain.remove('a');
        expect(p.image('a'), equals('a'));
        expect(p.domain, equals(['a']));
      });
    });
  });
}
