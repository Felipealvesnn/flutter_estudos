import 'package:flutter/material.dart';
import 'package:meals/screens/carne_details.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (ctx) => const Tabs_screen(),
        AppRoutes.categoriesMeals: (ctx) => const CategoriesMealsScreen(),
         AppRoutes.carneDEtails: (ctx) => const CarneDetails(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/outra-coisa') {
          return null;
        } else {
          return MaterialPageRoute(builder: (_){
            return const CategoriesScreen();
          });
         
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_){
            return const CategoriesScreen();
          });
      },
      
    );
  }
}
