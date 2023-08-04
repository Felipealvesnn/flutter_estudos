import 'package:flutter/material.dart';
import 'package:shop_roupas/models/product.dart';

import '../models/product_list.dart';

class Product_item extends StatelessWidget {
 final Product model; 
  const Product_item(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('data')
      ],
    );
  }
}