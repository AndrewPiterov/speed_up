import 'package:given_when_then_unit_test/res/given.dart';
import 'package:given_when_then_unit_test/res/then.dart';
import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';

enum Seasons {
  winter,
  summer,
}

void main() {
  given('enum', () {
    const season = Seasons.summer;

    then('season should be Summer', () {
      season.title.should.be('summer');
    });
  });

  given('nullable enum', () {
    // ignore: prefer_const_declarations, unnecessary_nullable_for_final_variable_declarations
    final Seasons? season = Seasons.winter;

    then('season should be Summer', () {
      season.title.should.as('Season').be('winter');
    });
  });
}
