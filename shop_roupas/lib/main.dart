import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 99, 28, 222)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page', style: TextStyle(
            color: Colors.white,
          ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer:const  Drawer(),
        body: const Center(
          child: Text('Hello, world!'),
        ),
      ),
      );
    
  }
}

