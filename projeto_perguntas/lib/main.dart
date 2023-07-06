import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());


class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
 State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
      'pergunta nova'
    ];
  void responder() {
    setState(() {
      perguntaSelecionada++;
      if (perguntaSelecionada >= perguntas.length ) {
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
          title:const Text('Perguntas'),
          
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(perguntas[perguntaSelecionada]),
              ),
              ElevatedButton(
                onPressed: responder,
                child: const Text('Resposta 1'),
              ),
              ElevatedButton(
                onPressed: responder,
                child: const Text('Resposta 2'),
              ),
              ElevatedButton(
                onPressed: responder,
                child: const Text('Resposta 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

