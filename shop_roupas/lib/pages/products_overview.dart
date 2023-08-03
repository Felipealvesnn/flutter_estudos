import 'package:flutter/material.dart';

import '../components/Product_grid.dart';

class Products_overview extends StatelessWidget {
  Products_overview({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 245, 245, 245)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Shop Roupas'),
        actions: [
          PopupMenuButton(itemBuilder: (_){
            return [
              PopupMenuItem(child: Text('Favoritos'), value: 0,),
              PopupMenuItem(child: Text('Todos'), value: 1,),
            ];
          })
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      body: Product_grid(),
      
    );
  }
}

