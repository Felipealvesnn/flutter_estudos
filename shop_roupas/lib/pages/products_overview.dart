import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/Product_grid.dart';
import '../models/product.dart';
import '../models/product_list.dart';

enum FilterOptions { Favorites, All }

class Products_overview extends StatefulWidget {
  Products_overview({super.key});

  @override
  State<Products_overview> createState() => _Products_overviewState();
}

class _Products_overviewState extends State<Products_overview> {
 bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    final Product_list product = Provider.of<Product_list>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 245, 245, 245)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Shop Roupas'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Favoritos'),
                  value: FilterOptions.Favorites,
                   onTap: () {
                    setState(() {
                      _showFavoriteOnly = false;
                    });
                   
                  },
                ),
                PopupMenuItem(
                  child: Text('Todos'),
                  value: FilterOptions.All,
                  onTap: () {
                    setState(() {
                      _showFavoriteOnly = true;
                    });
                              
                  },
                ),
              ];
            },
            onSelected: (FilterOptions value) {
              print(value);
            },
          )
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      body: Product_grid(_showFavoriteOnly),
    );
  }
}
