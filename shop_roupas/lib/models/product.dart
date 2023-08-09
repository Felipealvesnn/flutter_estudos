import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../exceptions/http_exception.dart';
import '../utils/constantes.dart';

class Product with ChangeNotifier {
  
  final String id;
  final title;
  final description;
  final price;
  final imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String _token ) async {
    try {
      _toggleFavorite();
      final response = await http.patch(
        Uri.parse('${Constantes.baseUrl}/products/$id.json?auth=$_token'),
        body: json.encode({'isFavorite': isFavorite}),
      );
      if (response.statusCode >= 400) {
        _toggleFavorite();
        throw Http_Exception(
            'Ocorreu um erro na exclusão do produto', response.statusCode);
      }
    } catch (error) {
      throw Http_Exception('Ocorreu um erro na exclusão do produto', 500);
    }
  }
}
