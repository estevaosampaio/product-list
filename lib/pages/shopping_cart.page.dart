import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list/stores/shopping_cart.store.dart';

class ShoppingCartPage extends StatelessWidget {
  final cartStore = GetIt.I.get<ShoppingCartStore>();

  ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('backBtn'),
        backgroundColor: const Color(0xFFFAD243),
        title: const Text('Carrinho de compras'),
      ),
      body: cartStore.productsInCart.isEmpty
          ? Center(
              child: Image.asset(
                key: Key('imageCart'),
                'assets/empty_cart.png',
                height: 200,
              ),
            )
          : ListView.builder(
              itemCount: cartStore.productsInCart.length,
              itemBuilder: (ctx, index) {
                final product = cartStore.productsInCart[index];
                return Text(
                  '${product.id} - ${product.name} - ${product.price}',
                );
              },
            ),
    );
  }
}
