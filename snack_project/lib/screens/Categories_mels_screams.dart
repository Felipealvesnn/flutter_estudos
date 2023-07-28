import 'package:flutter/material.dart';
import 'package:snack_project/data/dummy_data.dart';

import '../Components/meal-item.dart';
import '../models/category.dart';

class CategoriesMelsScrees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categorymeals = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title ?? ''),
      ),
      body: ListView.builder(
          itemCount: categorymeals.length,
          itemBuilder: ((context, index) => ListTile(
                title: MealiTEM(categorymeals[index]),
              ))),
    );
  }
}
