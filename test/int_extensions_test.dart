import 'package:given_when_then_unit_test/res/given.dart';
import 'package:given_when_then_unit_test/res/then.dart';
import 'package:given_when_then_unit_test/res/when.dart';
import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';

void main() {
  given('Int number', () {
    const intNum = 5;
    then('is between', () {
      intNum.isBetween(1, 10).should.beTrue();
    });

    then('is not between', () {
      intNum.isBetween(1, 4).should.beFalse();
    });

    when('check between', () {
      when('can be equal some edge', () {
        then('min edge', () {
          intNum.isBetween(5, 10, orEqualSomeEdge: true).should.beTrue();
        });

        then('max edge', () {
          intNum.isBetween(1, 5, orEqualSomeEdge: true).should.beTrue();
        });
      });
    });
  });
}
