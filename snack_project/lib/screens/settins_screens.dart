import 'package:flutter/material.dart';

import '../Components/main_drawer.dart';

class Settins_screens extends StatelessWidget {
  const Settins_screens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const Main_drawer(),
      body: Center(
        child: Text('Configurações'),
      ),
      
    );
  }
}