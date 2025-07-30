import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_perguntas/questionario.dart';

void main() {
  testWidgets('Questionario exibe pergunta e respostas, e chama o callback ao tocar',
      (WidgetTester tester) async {
    // Variável para verificar se a função responder foi chamada com valor esperado
    int? respostaSelecionada;

    // Dados de exemplo
    final perguntas = [
      {
        'texto': 'Qual sua linguagem favorita?',
        'resposta': [
          {'texto': 'Dart', 'nota': 5},
          {'texto': 'Python', 'nota': 3},
          {'texto': 'Java', 'nota': 1},
        ],
      }
    ];

    // Renderiza o widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Questionario(
            perguntas: perguntas,
            perguntaSelecionada: 0,
            responder: (nota) {
              respostaSelecionada = nota;
            },
          ),
        ),
      ),
    );

    // Verifica se o texto da pergunta aparece
    expect(find.text('Qual sua linguagem favorita?'), findsOneWidget);

    // Verifica se todas as respostas aparecem
    expect(find.text('Dart'), findsOneWidget);
    expect(find.text('Python'), findsOneWidget);
    expect(find.text('Java'), findsOneWidget);

    // Simula um toque na resposta "Python"
    await tester.tap(find.text('Python'));
    await tester.pump();

    // Verifica se a função `responder` foi chamada com o valor correto
    expect(respostaSelecionada, 3);
  });
}
