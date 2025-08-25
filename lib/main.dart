import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list/pages/products.page.dart';
import 'package:product_list/stores/products.store.dart';
import 'package:product_list/stores/shopping_cart.store.dart';

void main() {
  GetIt.I.registerSingleton<ProductsStore>(ProductsStore());
  GetIt.I.registerSingleton<ShoppingCartStore>(ShoppingCartStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      home: ProductsPage(),
    );
  }
}
