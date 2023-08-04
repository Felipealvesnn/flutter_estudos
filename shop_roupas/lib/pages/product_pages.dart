import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/product_list.dart';

import '../components/Drawer.dart';
import '../models/cart.dart';

class product_pages extends StatelessWidget {
  const product_pages({super.key});

  @override
  Widget build(BuildContext context) {
    final produts = Provider.of<Product_list>(context);
    return Scaffold(
      appBar: AppBar(
      
        title: const Text('Produtos'),
      ),
      drawer: Drwaer_arquivo(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:ListView.builder(
            itemCount: produts.itemsCount,
            itemBuilder:(context, index) => 
            Text(produts.list[index].title)
            , ) ,
      ),
      )
    );
  }
}