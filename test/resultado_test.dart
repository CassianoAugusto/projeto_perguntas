import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() {
  group('Resultado Widget', () {
    testWidgets('Exibe "Você precisa melhorar!" quando notaTotal < 15',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Resultado(notaTotal: 10),
        ),
      );

      expect(find.text('Você precisa melhorar!'), findsOneWidget);
    });

    testWidgets('Exibe "Bom trabalho!" quando 15 <= notaTotal < 20',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Resultado(notaTotal: 17),
        ),
      );

      expect(find.text('Bom trabalho!'), findsOneWidget);
    });

    testWidgets('Exibe "Excelente!" quando notaTotal >= 20',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Resultado(notaTotal: 22),
        ),
      );

      expect(find.text('Excelente!'), findsOneWidget);
    });

    testWidgets('Botão Reiniciar está presente e navegável',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Resultado(notaTotal: 20),
        ),
      );

      expect(find.text('Reiniciar'), findsOneWidget);

      await tester.tap(find.text('Reiniciar'));
      await tester.pumpAndSettle();

      expect(find.text('Perguntas'), findsOneWidget);
    });
  });
}
