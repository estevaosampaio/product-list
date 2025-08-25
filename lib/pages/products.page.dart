import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list/stores/products.store.dart';
import 'package:product_list/widgets/app_bar.widget.dart';
import 'package:product_list/widgets/filter_result.widget.dart';
import 'package:product_list/widgets/product_item.widget.dart';

class ProductsPage extends StatelessWidget {
  final productsStore = GetIt.I.get<ProductsStore>();

  ProductsPage({super.key}) {
    productsStore.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAD243),
        toolbarHeight: 100,
        title: const AppBarContent(),
      ),
      body: Column(
        children: [
          FilterResult(),
          Expanded(
            child: Observer(
              builder: (context) {
                return productsStore.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: productsStore.products.length,
                        itemBuilder: (ctx, index) {
                          final product = productsStore.products[index];
                          return ProductItem(
                            key: Key('productItem'),
                            product: product,
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
