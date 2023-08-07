import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/product.dart';

import '../models/product_list.dart';
import '../utils/app_routes.dart';


class Product_item extends StatelessWidget {
 final Product model; 
  const Product_item(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
        return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(model.imageUrl),
      ),
      title: Text(model.title),
      trailing: SizedBox(
        width: 100,
        child: Row(
       
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  App_routes.product_form,
                  arguments: model,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
               color: Theme.of(context).colorScheme.error,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Produto'),
                    content: const Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                ).then((value) {
                  if (value) {
                    Provider.of<Product_list>(context, listen: false)
                        .removeProduct(model);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}