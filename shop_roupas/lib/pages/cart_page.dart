import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class Cart_page extends StatelessWidget {
  const Cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
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
                    'R\$ ${cart.totalAmount}',
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.headline6!.color,
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
          )
        ],
      ),
    );
  }
}
