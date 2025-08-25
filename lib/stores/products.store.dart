import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:product_list/models/product.model.dart';

part 'products.store.g.dart';

class ProductsStore = ProductsStoreBase with _$ProductsStore;

abstract class ProductsStoreBase with Store {
  @observable
  ObservableList<Product> products = <Product>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadProducts() async {
    isLoading = true;

    products.clear();

    await Future.delayed(Duration(seconds: 2));

    final productsTemp = List.generate(
      10,
      (index) => Product(
        id: index,
        name: 'Apple Iphone 11 Pro (128gb) - Preto',
        price: 599.90 * (index + 1),
        rate: Random().nextInt(6).toDouble(),
      ),
    );

    products.addAll(productsTemp);

    isLoading = false;
  }
}
