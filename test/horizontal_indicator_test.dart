import 'package:flutter_test/flutter_test.dart';

import 'package:horizontal_indicator/horizontal_indicator.dart';

void main() {
  // test('Date indicator initialze test', () {

  // });
  testWidgets('Date indicator initialze test', (WidgetTester tester) async {
    await tester.pumpWidget(DateIndicator(), Duration(seconds: 10));

    final dayOneFinder = find.text('1');
    final zeroFinder = find.text('0');

    await tester.tap(find.text("1"));
    await tester.pump();

    expect(dayOneFinder, findsOneWidget);
    expect(zeroFinder, findsNothing);
  });
}
