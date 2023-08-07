import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_roupas/models/product.dart';

class Product_form extends StatefulWidget {
  const Product_form({super.key});

  @override
  State<Product_form> createState() => _Product_formState();
}

class _Product_formState extends State<Product_form> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formakay = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlFocusNode.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageUrlFocusNode.addListener(_updateImageUrl);
  }

  void _updateImageUrl() {
    setState(() {});
  }

  void _saveForm() {
   final isvalid = _formakay.currentState?.validate()?? false;
   if(!isvalid){
    return;
   }
      _formakay.currentState?.save();

    final newProduct = Product(
        id: Random().nextDouble().toString(),
        title: _formData['title'],
        description: _formData['desciption'],
        price: _formData['price'],
        imageUrl: _formData['imageUrl']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Produtos'),
        actions: [
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _formakay,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Titulo'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                keyboardType: TextInputType.name,
                onSaved: (newValue) {
                  _formData['title'] = newValue ?? '';
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Titulo invalido';
                  }
                  if (value.trim().length < 3) {
                    return 'Titulo muito pequeno. Minimo 3 letras';
                  }
                  return null;
                },
              ),
              TextFormField(
                onSaved: (newValue) {
                  _formData['price'] = double.parse(newValue ?? '0');
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Preço invalido';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Preço invalido';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Preço deve ser maior que zero';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                focusNode: _priceFocusNode,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], // Use o formatter para permitir apenas dígitos
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              TextFormField(
                onSaved: (newValue) {
                  _formData['desciption'] = newValue ?? '';
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Descrição invalida';
                  }
                  if (value.trim().length < 10) {
                    return 'Descrição muito pequena. Minimo 10 letras';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageUrlFocusNode);
                },
                focusNode: _descriptionFocusNode,
                keyboardType: TextInputType.multiline,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? const Text('Nenhuma imagem!')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      onSaved: (newValue) {
                        _formData['imageUrl'] = newValue ?? '';
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'URL invalida';
                        }
                        if (!value.trim().startsWith('http') &&
                            !value.trim().startsWith('https')) {
                          return 'URL invalida';
                        }
                        if (!value.trim().endsWith('.png') &&
                            !value.trim().endsWith('.jpg') &&
                            !value.trim().endsWith('.jpeg')) {
                          return 'URL invalida';
                        }
                        return null;
                      },
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      decoration:
                          const InputDecoration(labelText: 'URL da Imagem'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
