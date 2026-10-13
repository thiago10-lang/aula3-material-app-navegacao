import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio_02/main.dart';

void main() {
  testWidgets('Theme interno sobrescreve a cor para amarelo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final cores = tester
        .widgetList<Container>(find.ancestor(
          of: find.text('Widget'),
          matching: find.byType(Container),
        ))
        .map((c) => c.decoration)
        .whereType<BoxDecoration>()
        .map((d) => d.color)
        .toList();

    expect(cores, contains(Colors.lightBlue));
    expect(cores, contains(Colors.yellow.shade200));
  });
}
