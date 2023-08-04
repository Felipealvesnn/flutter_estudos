import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_roupas/models/cart.dart';

import 'cart_item.dart';

class Order_pedidos {
  final String id;
  final double amount;
  final List<Cart_item> products;
  final DateTime dateTime;

  const Order_pedidos({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Order_list with ChangeNotifier {
  List<Order_pedidos> _items = [];

  List<Order_pedidos> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart order) {
    _items.insert(
        0,
        Order_pedidos(
          id: Random().nextDouble().toString(),
          amount: order.totalAmount,
          products: order.items.values.toList(),
          dateTime: DateTime.now(),
        ));
    notifyListeners();
  }
}
