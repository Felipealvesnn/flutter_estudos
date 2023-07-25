import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm( BuildContext context) {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return _showMyDialog(context);
    }

    widget.onSubmit(title, value, _selectedDate);
  }


  Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        ),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Insira um valor maior que 0!'),
              Text('insira um valor valido!!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  showdatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          _selectedDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding:  EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,   
          ),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                onSubmitted: (_) => _submitForm( context),
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(context),
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: _selectedDate == null
                          ? Text("Nenhuma data selecionada!")
                          : Text(
                              'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                            ),
                    ),
                    TextButton(
                      child: const Text(
                        'Selecionar data',
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: showdatepicker,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Color.fromARGB(255, 251, 251, 251),
                      ),
                    ),
                    onPressed: () =>_submitForm(context),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
