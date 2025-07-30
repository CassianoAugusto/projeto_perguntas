import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_perguntas/questao.dart';

void main() {
  testWidgets('Exibe o texto corretamente no widget Questao',
      (WidgetTester tester) async {
    // Texto de exemplo
    const textoPergunta = 'Qual é a sua cor favorita?';

    // Constrói o widget dentro de um MaterialApp (necessário para usar temas e layout corretamente)
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Questao(texto: textoPergunta),
        ),
      ),
    );

    // Verifica se o texto está visível
    expect(find.text(textoPergunta), findsOneWidget);

    // Verifica se o texto está centralizado
    final textWidget = tester.widget<Text>(find.text(textoPergunta));
    expect(textWidget.textAlign, TextAlign.center);

    // Verifica o estilo de texto
    expect(textWidget.style?.fontSize, 28);
    expect(textWidget.style?.color, Colors.black);
  });
}
