import 'package:flutter/material.dart';

class auth_page extends StatelessWidget {
  const auth_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autenticação'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Entrar'),
          onPressed: () {},
        ),
      ),
    );
  }
}