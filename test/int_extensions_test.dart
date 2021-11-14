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

  given('epoch', () {
    const epoch = 1636865303;

    then('toDateFromSecUnixTimestamp in UTC should retrun Date', () {
      final date = epoch.toDateFromSecUnixTimestamp();

      date.year.should.be(2021);
      date.month.should.be(11);
      date.day.should.be(14);
      date.hour.should.be(4);
      date.minute.should.be(48);
      date.second.should.be(23);
    });

    then('toDateFromSecUnixTimestamp in Local should retrun Date', () {
      final date = epoch.toDateFromSecUnixTimestamp(asLocal: true);

      final utc = epoch.toDateFromSecUnixTimestamp();
      final offset = DateTime.now().timeZoneOffset;
      final local = utc.add(offset);

      date.year.should.be(local.year);
      date.month.should.be(local.month);
      date.day.should.be(local.day);
      date.hour.should.be(local.hour);
      date.minute.should.be(local.minute);
      date.second.should.be(local.second);
    });
  });
}
