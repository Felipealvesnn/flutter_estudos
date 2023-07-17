import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget { 
final List<transaction> transactions;

 TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return   Column(
            children: [
              ...transactions.map((tr) {
                return Card(
                  child: Row(
                    children: [
                      Container(  
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                         'R\$ ${ tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                        ],
                      )
                    ],
                  ),
                );
              }).toList()
            ],
            
          );
  }
}