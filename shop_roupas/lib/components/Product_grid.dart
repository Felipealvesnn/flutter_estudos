import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/components/product_item.dart';

import '../models/product.dart';
import '../models/product_list.dart';

class Product_grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Providers = Provider.of<Product_list>(context);
    final List<Product> loadedProducts = Providers.list;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => Container(
        child: Center(
          child: ChangeNotifierProvider(
            create: (ctx) => loadedProducts[i],
            child: Product_item(),
          ),
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
    );
  }
}
