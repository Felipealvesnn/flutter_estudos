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
  void fetchData() async {

    String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Request successful, handle the response
        print(response.body);
      } else {
        // Request failed with an error status code
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred while making the request
      print('Error: $e');
    }
  }
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Product_list(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order_list(),
        ),
         ChangeNotifierProvider(
          create: (ctx) => Auth(),
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
