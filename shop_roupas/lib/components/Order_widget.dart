import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_roupas/models/order_pedidos.dart';

class Order_widget extends StatefulWidget {
  final Order_pedidos order;

  const Order_widget(this.order, {super.key});

  @override
  State<Order_widget> createState() => _Order_widgetState();
}

class _Order_widgetState extends State<Order_widget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
         ListTile(
                  title: Text('R\$ ${widget.order.amount.toStringAsFixed(2)}'),
                  subtitle: Text(DateFormat('dd/mm/yyyy hh:mm')
                      .format(widget.order.dateTime)),
                  trailing: IconButton(
                    icon:
                        Icon(_expanded ? Icons.expand_more : Icons.expand_less),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  ),
                ),
          if (_expanded) ListPedindos(widget: widget)
        ],
      ),
    );
  }
}

class ListPedindos extends StatelessWidget {
  const ListPedindos({
    super.key,
    required this.widget,
  });

  final Order_widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        height: widget.order.products.length * 25.0 + 10,
        child: ListView(
          children: widget.order.products.map((prod) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  prod.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${prod.quantity}x R\$${prod.price}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                )
              ],
            );
          }).toList(),
        ));
  }
}
