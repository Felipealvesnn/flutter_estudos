import 'package:flutter/material.dart';
import 'package:projeto_perguntas/respostas.dart';

import 'Questao.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final List<Map<String, dynamic>> perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
    {
      'texto': 'Qual é o seu funcionario favorito?',
      'respostas': ['wd', 'nelson', 'iure', 'felipe'],
    }
  ];
  void responder() {
    setState(() {
      perguntaSelecionada++;
      if (perguntaSelecionada >= perguntas.length) {
        perguntaSelecionada = 0;
      }
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'First app Felipe',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Questao(perguntas[perguntaSelecionada]['texto']),
             
              reposta('Resposta 1', responder),
              reposta('Resposta 2', responder),
              reposta('Resposta 3', responder),
            ],
          ),
        ),
      ),
    );
  }
}
