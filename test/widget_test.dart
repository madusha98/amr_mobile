// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:amr_mobile/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:amr_mobile/main.dart';

void main() {
  testWidgets('Intro Flow Widget Test', (WidgetTester tester) async {
    await tester.pumpAndSettle(const Duration(seconds: 5));
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('DONE'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('DONE'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Sign In'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Sign In'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });

  test('Utils - Get day suffix', () {
    expect(getDayOfMonthSuffix(31), 'st');
    expect(getDayOfMonthSuffix(22), 'nd');
    expect(getDayOfMonthSuffix(3), 'rd');
    expect(getDayOfMonthSuffix(11), 'th');
    expect(getDayOfMonthSuffix(13), 'th');
    expect(getDayOfMonthSuffix(30), 'th');
  });

  test('Utils - verify email', () {
    expect(verifyEmail('abcd@gmail.com'), true);
    expect(verifyEmail('test'), false);
  });

  test('Utils -  verify nic', () {
    expect(verifyNic('862348594v'), true);
    expect(verifyNic('199226025738'), true);
    expect(verifyNic('90202020'), false);
  });
  test('Utils -  verify nic', () {
    expect(verifyMobile('0752003250'), true);
    expect(verifyMobile('434353424'), false);
  });
}
