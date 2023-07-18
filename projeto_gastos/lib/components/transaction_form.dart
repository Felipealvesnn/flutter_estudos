import 'package:flutter/material.dart';

class TransctionForm extends StatelessWidget {
 
  final tittleController =TextEditingController();
  final valueController = TextEditingController();
   final void Function(String, double) onSubmit;
    TransctionForm(this.onSubmit, {super.key});



  @override
  Widget build(BuildContext context) {
    _submitForm() {
  final title = tittleController.text;
  final value = double.tryParse(valueController.text) ?? 0.0;

  if (title.isEmpty || value <= 0) {
    // Exibe o SnackBar com a mensagem
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('O título está vazio.'),
      ),
    );
    return;
  }

  onSubmit(title, value);
}

    return    Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller:  tittleController,
                    onSubmitted: (value) => _submitForm(),
                    decoration: const InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: valueController ,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                     onSubmitted: (value) => _submitForm(),
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
                          _submitForm(),
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