import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_gastos/components/transaction_form.dart';
import 'package:projeto_gastos/components/transaction_list.dart';

import '../models/transaction.dart';

class TRansactionUser extends StatefulWidget {
  const TRansactionUser({super.key});

  @override
  State<TRansactionUser> createState() => _TRansactionUserState();
}

class _TRansactionUserState extends State<TRansactionUser> {
  
  final _finalTransactions = [
    transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
      transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
      transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
      transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
      transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];



void _addTransaction(String title, double value){

  final newTransaction = transaction(
    id: Random().nextDouble().toString(),
    title: title,
    value: value,
    date: DateTime.now(),
  );

  setState(() {
    _finalTransactions.add(newTransaction);
  });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          TransctionForm(_addTransaction),
          TransactionList(_finalTransactions)
       
      ],
    );
  }
}