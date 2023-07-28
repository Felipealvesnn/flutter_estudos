import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:snack_project/screens/Categories_mels_screams.dart';
import 'package:snack_project/screens/categories_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Importe o pacote sqflite_ffi


import 'Utils/Apps_routes.dart';
import 'data/DatabaseHelper.dart';
import 'models/category.dart';

void main() {
   databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos ?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      fontFamily: 'Raleway',
      canvasColor:const Color.fromRGBO(255, 254, 229, 1),
      textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge : const TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyMedium : const TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        titleLarge : const TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      ),
      routes: {
        Approutes.HOME:(ctx)=> CategoriesScreen(),
        Approutes.CATEGORIES_MEALS:(ctx)=> CategoriesMelsScrees(),
      },
     // home: CategoriesScreen(),
    );
  }
}
