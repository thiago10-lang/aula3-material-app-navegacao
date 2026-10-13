import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio_01/main.dart';

void main() {
  testWidgets('Widget usa a cor azul do ThemeData', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final container = tester.widget<Container>(find.ancestor(
      of: find.text('Widget'),
      matching: find.byType(Container),
    ));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, Colors.lightBlue);
  });
}
