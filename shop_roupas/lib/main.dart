import 'package:flutter/material.dart';
import 'package:shop_roupas/pages/product_details.dart';
import 'package:shop_roupas/pages/products_overview.dart';
import 'package:shop_roupas/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
        primary:  Colors.red,
        secondary: Colors.deepOrange,
        ),
        appBarTheme:const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 106, 10, 127),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        
        ),
        fontFamily: 'Lato',
      ),
      routes: {
        '/': (ctx) => Products_overview(),
        App_routes.product_details: (ctx) => Product_details(),
      },
     // home: Products_overview(),
      debugShowCheckedModeBanner: false,
    );
  }
}
