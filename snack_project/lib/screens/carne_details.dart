import 'package:flutter/material.dart';

import '../models/meal.dart';

class CarneDetails extends StatelessWidget {
  const CarneDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final carne = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: const Text('Carne'),),
      body: Center(
        child: Text(carne.title),
      )
    );
  }
}