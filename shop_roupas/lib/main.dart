import 'package:flutter/material.dart';
import 'package:shop_roupas/pages/products_overview.dart';

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
        colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 99, 28, 222)),
        useMaterial3: true,
        primarySwatch: Colors.purple,
        buttonTheme: ButtonThemeData(
         // colorScheme: Color.fromARGB(255, 213, 15, 41),
          buttonColor: Color.fromARGB(255, 213, 15, 41),
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: Products_overview(),
      debugShowCheckedModeBanner: false,
    );
  }
}
