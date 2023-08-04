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
 
  void addProduct(Product product) {
    _list.add(product);
    notifyListeners();
  }
}



  // void showFavoriteOnly() {
    //  bool _showFavoriteOnly = false;
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  // List<Product> get list {
  //   if (_showFavoriteOnly) {
  //     return _list.where((prod) => prod.isFavorite).toList();
  //   } else {
  //     return [..._list];
  //   }
  // }