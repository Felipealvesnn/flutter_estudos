import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_roupas/models/product.dart';

import 'cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, Cart_item> _items = {};

  Map<String, Cart_item> get items => {..._items};

  removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  clear() {
    _items = {};
    notifyListeners();
  }

  int get itemCount => _items.length;

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      //alterar quantidade
      _items.update(
          product.id,
          (existingCartItem) => Cart_item(
              productId: product.id,
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          product.id,
          () => Cart_item(
              productId: product.id,
              id: Random().nextDouble().toString(),
              title: product.title,
              quantity: 1,
              price: product.price));
    }
    notifyListeners();
  }
}
