import 'package:flutter/material.dart';

class Product {
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

void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
  }
  
}