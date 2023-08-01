import 'package:flutter/material.dart';

import '../Components/main_drawer.dart';
import '../models/meal.dart';
import 'categories_screen.dart';
import 'comidas_favoritas_screen.dart';

class Tabs_screen extends StatefulWidget {
  
  final List<Meal> comidasFavoritas;

  const Tabs_screen(this.comidasFavoritas, {Key? key}) : super(key: key);
  @override
  State<Tabs_screen> createState() => _Tabs_screenState();
}

class _Tabs_screenState extends State<Tabs_screen> {
  int _selectedScreenIndex = 0;
   List<Map<String, Object>> _screens = [];
    @override
  void initState() {
    super.initState();
    _screens = [
    {
      'title': 'Lista de Categorias',
      'screen': const CategoriesScreen(),
    },
    {
      'title': 'Minhas Comidas Favoritas',
      'screen': ComidaFavorita( widget.comidasFavoritas ,),
    }
  ];

  }

 
  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      drawer: const Main_drawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
