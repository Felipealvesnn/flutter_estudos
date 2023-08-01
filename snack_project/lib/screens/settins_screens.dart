import 'package:flutter/material.dart';

import '../Components/main_drawer.dart';
import '../models/settings.dart';

class Settins_screens extends StatefulWidget {
 final Function(Settings) funcaoParaMudar;
 final Settings settings;

  const Settins_screens(this.funcaoParaMudar,this.settings, {super.key});

  @override
  State<Settins_screens> createState() => _Settins_screensState();
}

class _Settins_screensState extends State<Settins_screens> {
  late Settings settidngs;
void initState(){
  super.initState();
  settidngs = widget.settings;
}
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) mudar,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        mudar(value);
        widget.funcaoParaMudar(settidngs);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const Main_drawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glutén!',
                    settidngs.isGlutenFree,
                    (value) {
                      setState(() {
                        settidngs.isGlutenFree = value;
                      });
                    },
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose!',
                    settidngs.isLactoseFree,
                    (value) {
                      setState(() {
                        settidngs.isLactoseFree = value;
                      });
                    },
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas!',
                    settidngs.isVegan,
                    (value) {
                      setState(() {
                        settidngs.isVegan = value;
                      });
                    },
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas!',
                    settidngs.isVegetarian,
                    (value) {
                      setState(() {
                        settidngs.isVegetarian = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
