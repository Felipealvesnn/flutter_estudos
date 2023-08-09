import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_roupas/models/product.dart';

import '../exceptions/http_exception.dart';
import '../utils/constantes.dart';

class Product_list with ChangeNotifier {
  final String? _token;
  final String? _uid;
  List<Product> _list = [];

  Product_list(this._token,this._uid, this._list);
  

  List<Product> get list {
    return [..._list];
  }

  List<Product> get favoriteItems {
    return _list.where((prod) => prod.isFavorite).toList();
  }

  int get itemsCount {
    return _list.length;
  }

  Future<void> addProductFromdata(Map<String, Object> data) {
    bool hasId = data.containsKey('id');
    final newProduct = Product(
        id: hasId ? data['id'] as String : Random().nextDouble().toString(),
        title: data['title'],
        description: data['desciption'],
        price: data['price'],
        imageUrl: data['imageUrl']);
    if (hasId) {
      return _updateProduct(newProduct);
    } else {
      return addProduct(newProduct);
    }
  }

  Future<void> _updateProduct(Product product) async {
    final response = await http.patch(
      Uri.parse('${Constantes.baseUrl}/products/${product.id}.json?auth=$_token'),
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'price': product.price,
        'imageUrl': product.imageUrl,
      }),
    );
  }

  Future<void> addProduct(Product product) async {
    final value = await http.post(Uri.parse('${Constantes.baseUrl}/products.json?auth=$_token'),
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'isFavorite': product.isFavorite,
        }));

    final id = json.decode(value.body)['name'];
    _list.add(Product(
      id: id,
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      isFavorite: product.isFavorite,
    ));
    notifyListeners();
  }

  Future<void> removeProduct(Product product) async {
    try {
      int index = _list.indexWhere((prod) => prod.id == product.id);
      if (index >= 0) {
        final product = _list[index];
        _list.remove(product);
        notifyListeners();
      }
      final response =
          await http.delete(Uri.parse('${Constantes.baseUrl}/products/${product.id}.json?auth=$_token'));
      if (response.statusCode >= 400) {
        _list.insert(index, product);
        notifyListeners();
        throw Http_Exception('Ocorreu um erro na exclusão do produto',
            response.statusCode);
      }
    } catch (error) {
      print(error);
    }
  }

  Future getProducts() async {
    final response = await http.get(Uri.parse('${Constantes.baseUrl}/products.json?auth=$_token'));
    Map<String, dynamic> data = json.decode(response.body);
    _list.clear();
    data.forEach((key, value) {
      _list.add(Product(
          id: key,
          description: value['description'],
          price: value['price'],
          imageUrl: value['imageUrl'],
          title: value['title'],
          isFavorite: value['isFavorite']));
    });
    notifyListeners();

    return Future.value();
  }
}
