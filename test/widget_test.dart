// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_movie_db/di/di.config.dart';
import 'package:flutter_movie_db/presentation/ui/screens/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_movie_db/main.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.dart';

void main() {

  setUpAll() {
    configureDependencies();
  }

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(HomePage());
    //
    // // Verify that our counter starts at 0.
    // expect(find.text('Home Page'), findsOneWidget);
    //
    // // Tap the '+' icon and trigger a frame.
    // // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // // Verify that our counter has incremented.
    // // expect(find.text('0'), findsNothing);
    // // expect(find.text('1'), findsOneWidget);
  });
}
