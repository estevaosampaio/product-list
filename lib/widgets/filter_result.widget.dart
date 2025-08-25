import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list/stores/products.store.dart';

class FilterResult extends StatelessWidget {
  final productsStore = GetIt.I.get<ProductsStore>();

  FilterResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border.all(style: BorderStyle.none),
      margin: EdgeInsets.zero,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(
              builder: (context) {
                return Text(
                  '${productsStore.products.length} resultados',
                );
              }
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Filtrar (1)',
                    style: TextStyle(color: Colors.blue[500]),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: Colors.blue[500],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
