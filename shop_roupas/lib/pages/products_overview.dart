import 'package:flutter/material.dart';
import 'package:shop_roupas/models/product.dart';

import '../components/product_item.dart';
import '../data/dummy_data.dart';

class Products_overview extends StatelessWidget {
   Products_overview({super.key});
  final List<Product> loadedProducts = dummyProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Roupas'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => Container(
          child: Center(child: Product_item(product:loadedProducts[i])),
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