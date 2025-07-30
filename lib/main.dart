import 'package:flutter/material.dart';

import 'package:projeto_perguntas/questionario.dart';

import 'package:projeto_perguntas/resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var notaTotal = 0;
  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?,',
      'resposta': [
        {'texto': 'Azul', 'nota': 5},
        {'texto': 'Amarelo', 'nota': 4},
        {'texto': 'Preto', 'nota': 3},
        {'texto': 'Vermelho', 'nota': 2},
      ]
    },
    {
      'texto': 'Qual é o seu prato favorito?',
      'resposta': [
        {'texto': 'Pizza', 'nota': 5},
        {'texto': 'Hambúrguer', 'nota': 1},
        {'texto': 'Sushi', 'nota': 5},
        {'texto': 'Macarrão', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é o seu esporte favorito?',
      'resposta': [
        {'texto': 'Futebol', 'nota': 5},
        {'texto': 'Basquete', 'nota': 1},
        {'texto': 'Tênis', 'nota': 5},
        {'texto': 'Natação', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Coelho', 'nota': 5},
        {'texto': 'Cachorro', 'nota': 1},
        {'texto': 'Gato', 'nota': 5},
        {'texto': 'Pássaro', 'nota': 1}
      ]
    },
  ];

  get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        notaTotal += nota;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Perguntas',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(
                notaTotal: notaTotal,
              ),
      ),
    );
  }
}
