

import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}



class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
       theme: ThemeData(
        useMaterial3: true,

      ),
      home:Scaffold(
        appBar: AppBar(
          title: const Text('pegrguntas'),

        ),
        body: const Column(
          children: [
             Text('corpo do scarfoold'),
          ],
        ),
      ),
    );
  }
}