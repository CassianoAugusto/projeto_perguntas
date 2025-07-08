import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  const Questao({super.key, required this.texto});
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
