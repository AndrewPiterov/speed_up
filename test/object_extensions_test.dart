// ignore_for_file: prefer_const_declarations, unnecessary_nullable_for_final_variable_declarations

import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/test.dart';

void main() {
  test('object should be null', () {
    final Object? someObj = null;
    someObj.isNull.should.beTrue();
  });

  test('object should not be null', () {
    final Object? someObj = 1;
    someObj.isNotNull.should.beTrue();
  });
}
