import 'dart:developer';

import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';

void main() {
  given('collection - takeRandom -', () {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

    when('take random elemenet', () {
      late List<bool> randomLoop;

      before(() {
        final nums = <int>[];
        final loop = <bool>[];

        for (var i = 0; i < arr.length; i++) {
          final ele = arr.random;
          if (nums.isEmpty) {
            loop.add(true);
            nums.add(ele!);
            continue;
          }

          loop.add(nums.last == ele);
          nums.add(ele!);
        }

        log('Random: $nums');
        randomLoop = loop;
      });

      then('should be randomize', () {
        randomLoop.should.contain(false);
      });

      then('should be unique', () {
        final uniqueRandom = arr.takeRandom(arr.length - 3);
        final distinct = uniqueRandom.toSet().toList();
        distinct.should.haveCount(uniqueRandom.length);
      });

      then('can contain duplicates', () {
        final random =
            arr.takeRandom(arr.length + 100, mayHaveDuplicates: true);
        final distinct = random.toSet().toList();
        random.length.should.not.be(distinct.length);
      });
    });

    when('take random elements', () {
      then('always result collections are different', () {
        final loops = <List<int>>[];

        for (var i = 0; i < 2; i++) {
          final items = arr.takeRandom(10);
          loops.add(items.toList());
        }

        log('First list: ${loops.first}');
        log('First list: ${loops.last}');

        loops.first.should.not.be(loops.last);
      });
    });

    when('count is less then 0', () {
      then('should throw error', () {
        final err =
            Should.throwError<RangeError>(() => arr.takeRandom(-1).toList());
        err.message.toString().should.be('`count` must not be negative.');
      });
    });
  });
}
