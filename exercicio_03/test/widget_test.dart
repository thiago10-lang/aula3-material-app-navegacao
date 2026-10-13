import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio_03/main.dart';

void main() {
  testWidgets('Login inválido exibe SnackBar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), 'usuario');
    await tester.enterText(find.byType(TextField).at(1), '0000');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Login Page'), findsOneWidget);
  });

  testWidgets('Login válido redireciona para a nova página', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), 'admin');
    await tester.enterText(find.byType(TextField).at(1), '1234');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Flutter By Example'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
