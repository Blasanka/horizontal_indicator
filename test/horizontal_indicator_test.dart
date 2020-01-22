import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:horizontal_indicator/horizontal_indicator.dart';

void main() {
  // test('Date horizontal_indicator initialze test', () {

  // });
  testWidgets("Is initialized date indicator with correct days for month", (
      WidgetTester tester) async {
    const Size screenSize = const Size(double.infinity, 68);

    Widget indicator = MaterialApp(home: Scaffold(body: DateIndicator()));

    await tester.pumpWidget(indicator);

    for (int i = 1; i <= 31; i++) {
      expect(find.text('$i'), equals("$i"));
      expect(tester.getSize(find.byWidget(indicator)),
          equals(screenSize));
    }

    final ScrollableState scrollableState =
    tester.state(find.byType(Scrollable));
    final ScrollPosition scrollPosition = scrollableState.position;
    scrollPosition.jumpTo(100.0);

    await tester.pump();
  });
}
