import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'resultado.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
    void responder() {
    setState(() {
      perguntaSelecionada++;
    
    });
   
  }

  bool get temperguntaSelecionada{

    return perguntaSelecionada < perguntas.length;
  }

  final List<Map<String, Object>> perguntas = [
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

  @override
  Widget build(BuildContext context) {
   List<String> respostas = temperguntaSelecionada ?
    perguntas[perguntaSelecionada]['respostas'] as List<String> : [];

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
        body:temperguntaSelecionada ?
        Questionario(responder,respostas,
        perguntas[perguntaSelecionada]['texto'] as String):
        const Resultado(),
      ),
    );
  }
}
