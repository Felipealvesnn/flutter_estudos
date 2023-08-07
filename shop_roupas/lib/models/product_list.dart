import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_roupas/data/dummy_data.dart';
import 'package:shop_roupas/models/product.dart';

class Product_list with ChangeNotifier {
  List<Product> _list = dummyProducts;
  final String _baseUrl =
      'https://shop-roupas-flutter-default-rtdb.firebaseio.com/';

  List<Product> get list {
    return [..._list];
  }

  List<Product> get favoriteItems {
    return _list.where((prod) => prod.isFavorite).toList();
  }

  int get itemsCount {
    return _list.length;
  }

  void addProductFromdata(Map<String, Object> data) {
    bool hasId = data.containsKey('id');
    final newProduct = Product(
        id: hasId ? data['id'] as String : Random().nextDouble().toString(),
        title: data['title'],
        description: data['desciption'],
        price: data['price'],
        imageUrl: data['imageUrl']);
    if (hasId) {
      _updateProduct(newProduct);
    } else {
      addProduct(newProduct);
    }
  }

  _updateProduct(Product product) {
    if (product != null && product.id != null) {
      final index = _list.indexWhere((prod) => prod.id == product.id);
      if (index >= 0) {
        _list[index] = product;
        notifyListeners();
      }
    }
  }

  void addProduct(Product product) {
    http
        .post(Uri.parse('$_baseUrl/products.json'),
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'price': product.price,
              'imageUrl': product.imageUrl,
              'isFavorite': product.isFavorite,
            }))
        .then((value) {
          final id = json.decode(value.body)['name'];
      _list.add(Product(
        id: id,
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        isFavorite: product.isFavorite,
      ));
    });

    notifyListeners();
  }

  void removeProduct(Product product) {
    if (product != null && product.id != null) {
      _list.removeWhere((prod) => prod.id == product.id);
      notifyListeners();
    }
  }

  getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products.json'));
    Map<String, dynamic> data = json.decode(response.body);
    _list.clear();
    if (data != null) {
      _list.addAll(data.values.map((prod) => Product(
            id: prod['id'],
            title: prod['title'],
            description: prod['description'],
            price: prod['price'],
            imageUrl: prod['imageUrl'],
            isFavorite: prod['isFavorite'],
          )));
      notifyListeners();
    }
    return Future.value();
  }
}
