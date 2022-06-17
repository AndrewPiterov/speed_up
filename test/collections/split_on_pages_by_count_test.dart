import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/scaffolding.dart';

void main() {
  const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  test('split_on_pages_by_count - full pages', () {
    final pages = arr.splitOnPagesBy(2).toList();
    pages.length.should.be(5);
    for (final page in pages) {
      page.length.should.be(2);
    }
  });

  test('split_on_pages_by_count - non full page', () {
    final pages = arr.splitOnPagesBy(3).toList();
    pages.length.should.be(4);
    for (var i = 0; i < pages.length; i++) {
      if (i == pages.length - 1) {
        pages[i].length.should.be(1);
      } else {
        pages[i].length.should.be(3);
      }
    }
  });
}
