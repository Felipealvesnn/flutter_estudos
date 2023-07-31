import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'comidas_favoritas_screen.dart';

class Tabs_screen extends StatelessWidget {
  const Tabs_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar?'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            ComidaFavorita(),
          ],
        ),
      ),
    );
  }
}
