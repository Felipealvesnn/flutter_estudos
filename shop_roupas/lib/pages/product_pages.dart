import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/product_list.dart';

import '../components/Drawer.dart';
import '../components/product_item.dart';
import '../utils/app_routes.dart';

class product_pages extends StatelessWidget {
  const product_pages({super.key});

  @override
  Widget build(BuildContext context) {
    final produts = Provider.of<Product_list>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Produtos'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(App_routes.product_form);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        drawer: Drwaer_arquivo(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: produts.itemsCount,
              itemBuilder: (context, index) => Column(
                children: [Product_item(produts.list[index]), const Divider()],
              ),
            ),
          ),
        ));
  }
}
