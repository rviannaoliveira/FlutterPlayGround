import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main/main_screen.dart';

void main() {
  testWidgets('widget should start with 0', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(
        title: 'something',
      ),
    ));

    final finder0 = find.text('0');
    expect(finder0, findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    final finder1 = find.text('1');
    expect(finder1, findsOneWidget);
    expect(finder0, findsNothing);
  });
}
