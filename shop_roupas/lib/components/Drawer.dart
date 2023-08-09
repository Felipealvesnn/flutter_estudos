import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../utils/app_routes.dart';

class Drwaer_arquivo extends StatelessWidget {
  const Drwaer_arquivo({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AppBar(
                title: const Text('Bem vindo Usuário'),
                automaticallyImplyLeading: false,
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.shop),
                title: const Text('Loja'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Pedidos'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(App_routes.Orders);
                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Produtos'),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(App_routes.product_pages);
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(App_routes.auth);
            },
          )
        ],
      ),
    );
  }
}
