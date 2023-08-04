import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/order_pedidos.dart';

import '../components/Drawer.dart';
import '../components/Order_widget.dart';

class Orders_page extends StatelessWidget {
  const Orders_page({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Order_list>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      drawer: Drwaer_arquivo(),
      body: 
      orders.itemsCount == 0 ? Center(child: Text('Sem pedidos')) :
      ListView.builder(
        itemBuilder: (ctx, i) => Order_widget(orders.items[i]),
        itemCount: orders.itemsCount,
      ),
    );
  }
}
