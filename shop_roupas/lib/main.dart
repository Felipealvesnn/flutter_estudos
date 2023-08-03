import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_roupas/pages/product_details.dart';
import 'package:shop_roupas/pages/products_overview.dart';
import 'package:shop_roupas/utils/app_routes.dart';
import 'package:http/http.dart' as http;


import 'models/product_list.dart';

void main() {
  runApp( MyApp());
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
   
    return ChangeNotifierProvider(
      create:(ctx) => Product_list(),
      child: MaterialApp(
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
      ),
    );
  }
}
