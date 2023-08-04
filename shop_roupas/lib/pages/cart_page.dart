import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/product_list.dart';

class Cart_page extends StatelessWidget {
  const Cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final itens = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total'),
                    SizedBox(width: 10),
                    Chip(
                      label: Text(
                        'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('COMPRAR'),
                    )
                  ]),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: itens.length,
            itemBuilder: (ctx, i) => Cart_item_widget(item: itens[i]),
          ))
        ],
      ),
    );
  }
}
