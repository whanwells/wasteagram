import 'package:test/test.dart';
import 'package:wasteagram/utils/date.dart';

void main() {
  test('formats dates', () {
    final date = DateTime(2021, 1, 1);
    expect(formatDate(date), 'Friday, January 1, 2021');
  });
}
