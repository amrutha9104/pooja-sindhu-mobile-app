import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pooja_sindhu/features/splash/presentation/screens/splash_screen.dart';

void main() {
  testWidgets('Splash screen renders placeholder content', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    expect(find.text('Pooja Sindhu'), findsOneWidget);
    expect(find.text('Day 1 scaffold'), findsOneWidget);
    expect(find.byIcon(Icons.temple_hindu), findsOneWidget);
  });
}

