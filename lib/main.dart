import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?,',
        'resposta': ['Azul', 'Vermelho', 'Verde']
      },
      {
        'texto': 'Qual é o seu esporte favorito?',
        'resposta': ['Futebol', 'Basquete', 'Vôlei']
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Coelho', 'Cachorro', 'Gato']
      },
    ];
    List<Widget> respostas = [];
    for (String resposta
        in perguntas[perguntaSelecionada]['resposta'] as List<String>) {
      respostas.add(
        Resposta(
          texto: resposta,
          onSelected: _responder,
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(
              texto: perguntas[perguntaSelecionada]['texto'] as String,
            ),
            ...respostas,
          ],
        ),
      ),
    );
  }
}
