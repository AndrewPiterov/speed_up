import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';

void main() {
  given('List', () {
    const list = [1, 2, 3, 4, 5];

    when('reorder list by index up', () {
      late List<int> newList;
      before(() {
        newList = list.reorderByIndexes(oldIndex: 1, newIndex: 0).toList();
      });
      then('should return new reordered list', () {
        //
        newList.should.be([2, 1, 3, 4, 5]);
      });
    });

    when('reorder list by up', () {
      late List<int> newList;
      before(() {
        newList = list.reorder(5, newIndex: 0).toList();
      });
      then('should return new reordered list', () {
        //
        newList.should.be([5, 1, 2, 3, 4]);
      });
    });

    when('reorder list by index down', () {
      late List<int> newList;
      before(() {
        newList = list.reorderByIndexes(oldIndex: 0, newIndex: 1).toList();
      });
      then('should return new reordered list', () {
        //
        newList.should.be([2, 1, 3, 4, 5]);
      });
    });

    when('reorder list down', () {
      late List<int> newList;
      before(() {
        newList = list.reorder(1, newIndex: 4).toList();
      });
      then('should return new reordered list', () {
        //
        newList.should.be([2, 3, 4, 5, 1]);
      });
    });
  });
}
