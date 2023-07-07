import 'package:flutter/material.dart';

class reposta extends StatelessWidget {
  final String Texto;
  final void Function() quandoSelecionado;
  const reposta(this.Texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: quandoSelecionado,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: Text(Texto),
        ),
      ),
    );
  }
}


