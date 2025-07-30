import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_perguntas/resposta.dart';

void main() {
  testWidgets('Resposta exibe o texto e executa a função ao pressionar',
      (WidgetTester tester) async {
    // Controle para verificar se o botão foi pressionado
    bool foiPressionado = false;

    // Renderiza o widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Resposta(
            texto: 'Exemplo de Resposta',
            onSelected: () {
              foiPressionado = true;
            },
          ),
        ),
      ),
    );

    // Verifica se o texto aparece no botão
    expect(find.text('Exemplo de Resposta'), findsOneWidget);

    // Simula o clique no botão
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifica se a função foi chamada
    expect(foiPressionado, isTrue);
  });
}
