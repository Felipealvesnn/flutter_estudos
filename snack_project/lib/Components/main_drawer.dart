import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class Main_drawer extends StatelessWidget {
  const Main_drawer({super.key});
  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _createItem(
            Icons.restaurant,
            'Refeições',
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          // Navigator.of(context).pushReplacementNamed('/') se vc quiser ir pra tela nova sem a opcao de voltar
          _createItem(
            Icons.settings,
            'Configurações',
            () => Navigator.of(context).pushReplacementNamed('/settings'),
          ),
        ],
      ),
    );
  }
  }