import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_perguntas/questao.dart';

void main() {
  testWidgets('Exibe o texto corretamente no widget Questao',
      (WidgetTester tester) async {
    const textoPergunta = 'Qual é a sua cor favorita?';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Questao(texto: textoPergunta),
        ),
      ),
    );

    expect(find.text(textoPergunta), findsOneWidget);

    final textWidget = tester.widget<Text>(find.text(textoPergunta));
    expect(textWidget.textAlign, TextAlign.center);

    expect(textWidget.style?.fontSize, 28);
    expect(textWidget.style?.color, Colors.black);
  });
}
