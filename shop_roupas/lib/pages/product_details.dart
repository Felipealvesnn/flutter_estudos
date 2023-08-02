import 'package:flutter/material.dart';
import 'package:shop_roupas/models/product.dart';

class Product_details extends StatelessWidget {
  const Product_details({super.key});
 
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: const Center(
        child:Text('Detalhes do produto'),
      ),

    );
  }
}