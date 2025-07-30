import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['resposta']
            as List<Map<String, Object>>
        : null;
    return Column(
      children: [
        Questao(
          texto: perguntas[perguntaSelecionada]['texto'] as String,
        ),
        const SizedBox(height: 10),
        ...respostas!
            .map((resp) => Resposta(
                texto: resp['texto'] as String,
                onSelected: () => responder(resp['nota'] as int)))
            .toList(),
      ],
    );
  }
}
