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
  final _perguntas = [
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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String>? respostas = temPerguntaSelecionada
        ? _perguntas[perguntaSelecionada]['resposta'] as List<String>
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(
                    texto: _perguntas[perguntaSelecionada]['texto'] as String,
                  ),
                  ...respostas!
                      .map((e) => Resposta(
                            texto: e,
                            onSelected: _responder,
                          ))
                      .toList(),
                ],
              )
            : null,
      ),
    );
  }
}
