import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];
 
    return Container(
  margin: const EdgeInsets.only(top: 20),
  child: Column(
    children: [
      Questao(perguntas[perguntaSelecionada]['texto'] as String),
      ...respostas
          .map((resp) => Resposta(
                resp['texto'] as String,
                () => quandoResponder(resp['nota'] as int),
              ))
          .toList(),
    ],
  ),
);

  }
}
