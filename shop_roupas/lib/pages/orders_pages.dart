import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/models/order_pedidos.dart';

import '../components/Drawer.dart';
import '../components/Order_widget.dart';


class orders_pages extends StatelessWidget {
  const orders_pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      drawer: const Drwaer_arquivo(),
      body: FutureBuilder(
        future: Provider.of<Order_list>(context, listen: false).loadOrders(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(
              child: Text('Ocorreu um erro!'),
            );
          } else {
            return Consumer<Order_list>(
              builder: (ctx, orders, child) => RefreshIndicator(
                onRefresh: () => orders.loadOrders(),
                child: ListView.builder(
                  itemCount: orders.itemsCount,
                  itemBuilder: (ctx, i) => Order_widget(orders.items[i]),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
