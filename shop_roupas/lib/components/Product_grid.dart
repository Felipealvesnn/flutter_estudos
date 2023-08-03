import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/components/product_item.dart';

import '../models/product.dart';
import '../models/product_list.dart';

class Product_grid extends StatelessWidget {
  final _showFavoriteOnly;
  const Product_grid(this._showFavoriteOnly, {super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Providers = Provider.of<Product_list>(context);
    
    final List<Product> loadedProducts = _showFavoriteOnly?
     Providers.list:Providers.favoriteItems ;
     
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => Container(
        child: Center(
          child: ChangeNotifierProvider.value(
            value: loadedProducts[i],
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
