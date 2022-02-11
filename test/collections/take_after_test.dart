import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';

import '../models.dart';

void main() {
  given('Collection = takeAfter -', () {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    const oleg = Person('Oleg');
    const ann2 = Person('Anna2');
    const people = [
      Person('Andrew'),
      oleg,
      Person('Anna'),
      ann2,
    ];

    when('7', () {
      then('should be 8', () {
        arr.takeAfter(7).should.be(8);
      });
    });

    when('non existing 700', () {
      then('should be null', () {
        arr.takeAfter(7).should.be(8);
      });
    });

    when('13', () {
      then('should be null', () {
        arr.takeAfter(13).should.beNull();
      });
    });

    when('by key', () {
      then('should be Anna', () {
        final person = people.takeAfter(oleg, where: (p) => p.name == 'Anna2');
        person.should.be(ann2);
      });
    });

    when('by key', () {
      then('should be null', () {
        final person =
            people.takeAfter(oleg, where: (p) => p.name == 'Annnnnn');
        person.should.beNull();
      });
    });
  });
}
