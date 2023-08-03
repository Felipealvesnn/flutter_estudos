import 'package:flutter/material.dart';
import 'package:shop_roupas/data/dummy_data.dart';
import 'package:shop_roupas/models/product.dart';

class Product_list  with ChangeNotifier{
 List<Product> _list = dummyProducts;

 List<Product> get list => [..._list];

 void addProduct(Product product){
   _list.add(product);
   notifyListeners();
 }

}