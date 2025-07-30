import 'package:flutter/material.dart';
import 'package:projeto_perguntas/main.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key, required this.notaTotal});

  final int notaTotal;

  String get fraseResultado {
    if (notaTotal < 15) {
      return 'Você precisa melhorar!';
    } else if (notaTotal < 20) {
      return 'Bom trabalho!';
    } else {
      return 'Excelente!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Center(
        child: Column(
          children: [
            Text(
              fraseResultado,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const PerguntaApp(),
                  ),
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'Reiniciar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
