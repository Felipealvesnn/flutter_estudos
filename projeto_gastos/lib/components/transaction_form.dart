import 'package:flutter/material.dart';

class TransctionForm extends StatelessWidget {
 
  final tittleController =TextEditingController();
  final valueController = TextEditingController();
   final void Function(String, double) onSubmit;
    TransctionForm(this.onSubmit, {super.key});
  @override
  Widget build(BuildContext context) {
    return    Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller:  tittleController,
                    decoration: const InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: valueController ,
                    decoration: const InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text(
                          'Nova Transação',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                          
                        ),
                        onPressed: ()=>{
                          onSubmit(
                            tittleController.text,
                            double.tryParse(valueController.text) ?? 0.0,
                          )
                        } ,
                      )
                    ],
                  ),
                
                ],
              ),
            ),
          )
       ;
  }
}