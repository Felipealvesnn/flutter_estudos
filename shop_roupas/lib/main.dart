import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/pages/auth_or_homepahe.dart';
import 'package:shop_roupas/pages/auth_page.dart';
import 'package:shop_roupas/pages/cart_page.dart';
import 'package:shop_roupas/pages/orders_pages.dart';
import 'package:shop_roupas/pages/product_details.dart';
import 'package:shop_roupas/pages/product_form.dart';
import 'package:shop_roupas/pages/product_pages.dart';
import 'package:shop_roupas/pages/products_overview.dart';
import 'package:shop_roupas/utils/app_routes.dart';
import 'package:http/http.dart' as http;

import 'models/auth.dart';
import 'models/cart.dart';
import 'models/order_pedidos.dart';
import 'models/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//funcao para testar http
 
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth,Product_list>(
          create: (ctx) => Product_list(),
          update: (ctx, auth, previousProducts) => Product_list(
            auth.token,
            auth.uid,
            previousProducts == null ? [] : previousProducts.list,
          ),
        ),
        ChangeNotifierProxyProvider<Auth,Order_list>(
          create: (ctx) => Order_list(),
          update: (ctx, auth, previousOrders) => Order_list(
            auth.token,
            auth.uid,
            previousOrders == null ? [] : previousOrders.items,),
         
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.red,
            secondary: Colors.deepOrange,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 106, 10, 127),
            elevation: 0,
            iconTheme: IconThemeData(color: Color.fromARGB(255, 251, 251, 251)),
          ),
          fontFamily: 'Lato',
        ),
        routes: {
           App_routes.auth: (ctx) => auth_or_homepahe(),
          App_routes.home: (ctx) => Products_overview(),
          App_routes.product_details: (ctx) => Product_details(),
          App_routes.Carrinho: (ctx) => Cart_page(),
          App_routes.Orders: (ctx) => orders_pages(),
          App_routes.product_pages: (ctx) => product_pages(),
          App_routes.product_form: (ctx) => Product_form(),
        },
        // home: Products_overview(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
