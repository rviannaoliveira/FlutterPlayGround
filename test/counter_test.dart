import 'package:flutter_test/flutter_test.dart';

import '../lib/counter.dart';

void main() {
  test('it should increment the value', () {
    final counter = Counter();

    expect(counter.value, 0);

    counter.increment();

    expect(counter.value, 1);
  });
}
