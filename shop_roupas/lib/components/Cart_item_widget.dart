import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/cart.dart';
import 'package:shop_roupas/models/cart_item.dart';

import '../models/product_list.dart';

class Cart_item_widget extends StatelessWidget {
  final Cart_item item;

  const Cart_item_widget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Carts = Provider.of<Cart>(context, listen: false);
    final Providers = Provider.of<Product_list>(context)
        .list
        .firstWhere((element) => element.id == item.productId);
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Tem certeza?'),
                  content: Text('Quer remover o item do carrinho?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Não')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Sim')),
                  ],
                  // backgroundColor: Colors.black54,
                ));
      },
      onDismissed: (direction) => {
        Carts.removeItem(item.productId),
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Expanded(
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child:
                    FittedBox(child: Text('R\$${item.price.toStringAsFixed(2)}')),
              ),
            ),
            title: FittedBox(child: Text(item.title, style:TextStyle(
           
              fontWeight: FontWeight.bold,
            
            ) ,)),
            subtitle: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                  'Total: R\$${(item.price * item.quantity).toStringAsFixed(2)}'),
            ),
            trailing: Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      Carts.diminuiItem(item.productId);
                    },
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('${item.quantity}x')),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Carts.addItem(Providers);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
