import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

  double totalSum = recentTransaction
    .where((transaction) =>
        transaction.date.day == weekDay.day &&
        transaction.date.month == weekDay.month &&
        transaction.date.year == weekDay.year)
    .fold(0.0, (sum, transaction) => sum + transaction.value);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
}
_percent(double value){
  return (value/_weekTotalValue);
}

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((tr) {
          return ChartBar(
            label: tr['day'] as String,
            value: tr['value'] as double,
            percentage: _percent(tr['value'] as double),
          );
        }).toList(),
      ),
    );
  }
}

