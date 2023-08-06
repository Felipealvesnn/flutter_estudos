import 'package:flutter/material.dart';

class Product_form extends StatefulWidget {
  const Product_form({super.key});

  @override
  State<Product_form> createState() => _Product_formState();
}

class _Product_formState extends State<Product_form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Produtos'),
      ),
      body: Container(),
    );
  }
}