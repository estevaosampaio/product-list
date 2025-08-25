import 'package:flutter/material.dart';
import 'package:product_list/widgets/address_search.widget.dart';
import 'package:product_list/widgets/seach_products.widget.dart';
import 'package:product_list/widgets/shopping_cart_icon.widget.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 35,
                child: SeachProducts(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ShoppingCartIcon(),
            ),
          ],
        ),
        SizedBox(height: 15),
        AddressSearch(),
      ],
    );
  }
}
