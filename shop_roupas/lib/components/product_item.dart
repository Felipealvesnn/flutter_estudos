import 'package:flutter/material.dart';
import 'package:shop_roupas/models/product.dart';


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
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
               color: Theme.of(context).colorScheme.error,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}