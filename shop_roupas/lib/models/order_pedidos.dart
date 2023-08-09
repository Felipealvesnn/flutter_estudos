import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shop_roupas/models/cart.dart';

import '../utils/constantes.dart';
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
  final String? _token;
  List<Order_pedidos> _items = [];

  Order_list(this._token, this._items);
  List<Order_pedidos> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addOrder(Cart order) async {
    final date = DateTime.now();
    final value =
        await http.post(Uri.parse('${Constantes.baseUrl}/Order_pedidos.json?auth=$_token'),
            body: json.encode({
              'amount': order.totalAmount,
              'products': order.items.values
                  .map((model) => {
                        'id': model.id,
                        'productId': model.productId,
                        'title': model.title,
                        'quantity': model.quantity,
                        'price': model.price,
                      })
                  .toList(),
              'dateTime': date.toIso8601String(),
            }));

    final id = json.decode(value.body)['name'];
    _items.insert(
        0,
        Order_pedidos(
          id: id,
          amount: order.totalAmount,
          products: order.items.values.toList(),
          dateTime: date,
        ));

    notifyListeners();
  }
 
Future<void> loadOrders() async {
    List<Order_pedidos> loadedItems = [];
    final response = await http.get(Uri.parse('${Constantes.baseUrl}/Order_pedidos.json?auth=$_token'));
    Map<String, dynamic> data = json.decode(response.body);
    if (data != null) {
      data.forEach((orderId, orderData) {
        loadedItems.add(Order_pedidos(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>).map((item) {
            return Cart_item(
              id: item['id'],
              productId: item['productId'],
              title: item['title'],
              quantity: item['quantity'],
              price: item['price'],
            );
          }).toList(),
        ));
      });
      _items = loadedItems.reversed.toList();
      notifyListeners();
    }
    return Future.value();
  }

}
