import 'package:flutter/material.dart';
import 'package:meals/screens/carne_details.dart';
import 'package:meals/screens/settins_screens.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
List<Meal> _availableMeals = dummyMeals;
List<Meal> _comidasFavoritas = [];
var settingds = Settings();
void _filterMeals(Settings settings) {
  setState(() {
    this.settingds = settings;
    _availableMeals = dummyMeals.where((meal) {
      return (!settings.isGlutenFree || meal.isGlutenFree) &&
          (!settings.isLactoseFree || meal.isLactoseFree) &&
          (!settings.isVegan || meal.isVegan) &&
          (!settings.isVegetarian || meal.isVegetarian);
    }).toList();
  });
}

void _toggleFavorite(Meal meal){
  setState(() {
    _comidasFavoritas.contains(meal) ? _comidasFavoritas.remove(meal) : _comidasFavoritas.add(meal);
  });
}

bool _isFavorite(Meal meal){
 
  return  _comidasFavoritas.contains(meal);
  
}

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
        AppRoutes.home: (ctx) =>  Tabs_screen(_comidasFavoritas),
        AppRoutes.categoriesMeals: (ctx) =>  CategoriesMealsScreen( availableMeals:_availableMeals,),
        AppRoutes.settings: (ctx) =>  Settins_screens(_filterMeals,settingds),
        AppRoutes.carneDEtails: (ctx) =>  CarneDetails(_toggleFavorite, _isFavorite),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/outra-coisa') {
          return null;
        } else {
          return MaterialPageRoute(builder: (_) {
            return const CategoriesScreen();
          });
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
