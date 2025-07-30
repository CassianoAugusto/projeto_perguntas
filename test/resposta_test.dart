import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_perguntas/resposta.dart';

void main() {
  testWidgets('Resposta exibe o texto e executa a função ao pressionar',
      (WidgetTester tester) async {
   
    bool foiPressionado = false;

   
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

    
    expect(find.text('Exemplo de Resposta'), findsOneWidget);

   
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

   
    expect(foiPressionado, isTrue);
  });
}
