import 'package:flutter/material.dart';

import '../Components/meal_item.dart';
import '../models/meal.dart';

class ComidaFavorita extends StatelessWidget {
  
final List<Meal> comidasFavoritas;

  const ComidaFavorita( this.comidasFavoritas, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  if(comidasFavoritas.isEmpty){

    return const Center(
      child: Text('Minhas Comidas Favoritas'),
    );
  }
  else{
    return ListView.builder(
      itemCount: comidasFavoritas.length,
      itemBuilder: (ctx, index) {
        return MealItem(comidasFavoritas[index]);
      },
    );
  }
  }
}
