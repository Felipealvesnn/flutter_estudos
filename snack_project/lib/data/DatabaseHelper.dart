import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Meals.dart';
import '../models/category.dart';
import 'dummy_data.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');

    return openDatabase(
      path,
      version: 4,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE categories(
            id TEXT PRIMARY KEY,
            title TEXT,
            color INTEGER
          )
        ''');

        // Inserir as categorias iniciais na tabela
        for (var category in dummyCategories) {
          await db.insert('categories', category.toMap());
        }
      await db.execute('''
  CREATE TABLE lanches(
    id TEXT PRIMARY KEY,
    title TEXT,
    imageUrl TEXT,
    categories TEXT, 
    ingredients TEXT,
    steps TEXT,
    duration INTEGER,
    isGlutenFree INTEGER,
    isLactoseFree INTEGER,
    isVegan INTEGER,
    isVegetarian INTEGER,
    complexity TEXT,
    cost TEXT
  )
''');

      for (var lanches in dummyMeals) {
          await db.insert('lanches', lanches.toMap());
        }
      },
    );
  }

  Future<List<Category>> getCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return List.generate(maps.length, (index) {
      return Category.fromMap(maps[index]);
    });
  }
  Future<List<Meal>> getMeals() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('lanches');
  return List.generate(maps.length, (index) {
    return Meal.fromMap(maps[index]);
  });
}

}
