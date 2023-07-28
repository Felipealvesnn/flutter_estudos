import 'package:flutter/material.dart';

import '../Components/Category_item.dart';
import '../data/DatabaseHelper.dart';
import '../data/dummy_data.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

      _creteCategory()async {
        final db = DatabaseHelper();
    // Obtém a lista de categorias do banco de dados
    final List<Category> categories = await db.getCategories();
    final wigne = categories.map((e) {
       return Category_item(e);

      }).toList();
   return  wigne;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Cozinhar?'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children:   dummyCategories.map((e) {
         return Category_item(e);
    
        }).toList(),
      ),
    );
  }
}


