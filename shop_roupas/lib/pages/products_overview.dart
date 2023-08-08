import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/cart.dart';

import '../components/Drawer.dart';
import '../components/Product_grid.dart';
import '../components/count_cart.dart';
import '../models/product_list.dart';
import '../utils/app_routes.dart';

enum FilterOptions { Favorites, All }

class Products_overview extends StatefulWidget {
  Products_overview({super.key});

  @override
  State<Products_overview> createState() => _Products_overviewState();
}

class _Products_overviewState extends State<Products_overview> {
  bool _showFavoriteOnly = false;
  bool _isloading = true;
  bool _iserro = false;

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<Product_list>(context, listen: false).getProducts();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      Provider.of<Product_list>(context, listen: false)
          .getProducts()
          .catchError((error) {
        setState(() {
          _isloading = false;
          _iserro = true;
        });
      }).then((value) {
        setState(() {
          _isloading = false;
        });
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 245, 245, 245)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Shop Roupas'),
        actions: [
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(App_routes.Carrinho);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            builder: (context, value, filho) =>
                Count_cart(value: value.itemCount, child: filho!),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Favoritos'),
                  value: FilterOptions.Favorites,
                  onTap: () {
                    setState(() {
                      _showFavoriteOnly = true;
                    });
                  },
                ),
                PopupMenuItem(
                  child: Text('Todos'),
                  value: FilterOptions.All,
                  onTap: () {
                    setState(() {
                      _showFavoriteOnly = false;
                    });
                  },
                ),
              ];
            },
            onSelected: (FilterOptions value) {
              print(value);
            },
          ),
        ],
      ),
      drawer: Drwaer_arquivo(),
      body: _iserro
          ? Center(child: Text('Error'))
          : (_isloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  //esse resfresh é para atualizar a pagina
                  onRefresh: () => _refreshProducts(context),
                  child: Product_grid(_showFavoriteOnly))),
    );
  }
}
