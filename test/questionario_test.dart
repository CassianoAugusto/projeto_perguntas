import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_perguntas/questionario.dart';

void main() {
  testWidgets(
      'Questionario exibe pergunta e respostas, e chama o callback ao tocar',
      (WidgetTester tester) async {
    int? respostaSelecionada;

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

    expect(find.text('Qual sua linguagem favorita?'), findsOneWidget);

    expect(find.text('Dart'), findsOneWidget);
    expect(find.text('flutter'), findsOneWidget);
    expect(find.text('Java'), findsOneWidget);

    await tester.tap(find.text('flutter'));
    await tester.pump();

    expect(respostaSelecionada, 3);
  });
}
