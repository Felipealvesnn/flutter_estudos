import 'package:flutter/material.dart';
import 'package:projeto_perguntas/respostas.dart';

import 'Questao.dart';

class Questionario extends StatelessWidget {
  final void Function() responder;
  final String texto;
  final List<String> respostas;
  const Questionario(this.responder, this.respostas, this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
           Questao(texto),
          ...respostas.map((t) => reposta(t, responder)).toList(),
        ],
      ),
    );
  }
}
