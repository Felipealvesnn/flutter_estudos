import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/product.dart';

import '../components/product_item.dart';
import '../data/dummy_data.dart';
import '../models/product_list.dart';

class Products_overview extends StatelessWidget {
  Products_overview({super.key});

  @override
  Widget build(BuildContext context) {
      final Providers = Provider.of<Product_list>(context);
      final List<Product> loadedProducts = Providers.list;
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 245, 245, 245)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Shop Roupas'),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => Container(
          child: Center(
            child: Product_item(product: loadedProducts[i]),
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
      ),
      
    );
  }
}
