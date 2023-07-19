import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.recentTransactions});
final List<Transaction> recentTransactions;

List<Map<String, Object>> get groupedTransactions {
  
  var list = List.generate(7, (index) {
    final weeday = DateTime.now().subtract(Duration(days: index));
    var dia = DateFormat.E().format(weeday)[0];
   
 double totalSum = recentTransactions
    .where((transaction) =>
        transaction.date.day == weeday.day &&
        transaction.date.month == weeday.month &&
        transaction.date.year == weeday.year)
    .fold(0.0, (sum, transaction) => sum + transaction.value);

    return {'day':dia,
    'value':totalSum
     };
  });
  
  
  return list;
}

@override
Widget build(BuildContext context) {
      var texts =  groupedTransactions.map((e) {
        return Text('${e['day']}: ${e['value']}'); // Use 'amount' em vez de 'value'
      }).toList();

  return Card(
    elevation: 6,
    margin: EdgeInsets.all(5),
    child: Row(
      children: texts, 
    ),
  );
}
}
