import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_roupas/data/dummy_data.dart';
import 'package:shop_roupas/models/product.dart';

class Product_list with ChangeNotifier {
  List<Product> _list = dummyProducts;

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
 _updateProduct(Product product){
   if(product != null && product.id != null){
     final index = _list.indexWhere((prod) => prod.id == product.id);
     if(index >= 0){
       _list[index] = product;
       notifyListeners();
     }
   }
}

void addProduct(Product product) {
    _list.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    if (product != null && product.id != null) {
      _list.removeWhere((prod) => prod.id == product.id);
      notifyListeners();
    }
  }
}