import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  Category({
    required this.id,
    required this.title,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': color.value, // Salvar o valor do color como inteiro no banco de dados
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      color: Color(map['color']), // Converter o inteiro de volta para Color
    );
  }
}
