import 'package:flutter/material.dart';
import 'package:snack_project/models/category.dart';

import '../Utils/Apps_routes.dart';
import '../screens/Categories_mels_screams.dart';

class Category_item extends StatelessWidget {
  const Category_item(this.category, {Key? key}) : super(key: key);
  final Category category;
_selectedCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder:(_){
    //     return  CategoriesMelsScrees(category);
    //   } )
    // );
    Navigator.of(context).pushNamed(
      Approutes.CATEGORIES_MEALS,
      arguments: category,
    );

}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {_selectedCategory(context);},
      borderRadius: BorderRadius.circular(15),
      splashFactory: Theme.of(context).splashFactory,
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Center(
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )),
    );
  }
}
