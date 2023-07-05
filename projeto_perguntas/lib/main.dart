

import 'package:flutter/material.dart';

void main() {
  runApp( MyHomePage());
}



class MyHomePage extends StatelessWidget {
 List<String> perguntas =[
"Pegunta 1", "Pergunta 2", "pegunta 3"

];
var perguntaSelecionada = 0;
 void responder(){
  perguntaSelecionada++;
  print ('Pergunta respondida!!');
 }

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
       theme: ThemeData(
        useMaterial3: true,

      ),
      home:Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text('pegrguntas')),

        ),
        body:  Center(
          child: Column(
            children: [        
               Text( perguntas[perguntaSelecionada]),
               ElevatedButton(
                child: Text("Resposta 1"),
                onPressed: responder,
              ),
                ElevatedButton(
                child: Text("Resposta 2"),
                onPressed: responder,
              ),
               ElevatedButton(
                child: Text("Resposta 3"),
                onPressed: responder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

