import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta({super.key, required this.texto, required this.onSelected});
  final String texto;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          onPressed: onSelected,
          child: Text(texto),
        ),
      ),
    );
  }
}
