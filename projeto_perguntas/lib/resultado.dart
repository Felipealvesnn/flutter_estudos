import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  final void Function() reiniciarQuestionario;
  const Resultado(this.pontuacao,this.reiniciarQuestionario, {super.key});
  String get fraseREsultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fraseREsultado,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
           SizedBox(height: 16), // Margem superior de 16 pixels
           ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 187, 19, 19),
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(20.0)
          ),
        onPressed: reiniciarQuestionario,
        child: const Text('Reiniciar?'),
      ),
        ],
      ),
      
    );
  }
}
