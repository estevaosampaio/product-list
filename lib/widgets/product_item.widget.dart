import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list/models/product.model.dart';
import 'package:product_list/stores/shopping_cart.store.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  void addProductInCart(BuildContext ctx) {
    final store = GetIt.I.get<ShoppingCartStore>();
    final result = store.addProductInCart(product);

    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(
          result ? 'Produto adicionado!' : 'Produto já existe no carrinho',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: result ? Colors.yellow[200] : Colors.red[200],
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        elevation: .5,
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.grey[300],
                  height: 250,
                  child: Image.asset(
                    key: Key('productImage'),
                    'assets/iphone.png',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    SizedBox(height: 5),
                    Text(
                      'R\$ ${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text: 'em ',
                        children: [
                          TextSpan(
                            text:
                                '10x R\$ ${(product.price / 10).toStringAsFixed(2)} sem juros',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Frete grátis',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Disponível em 6 cores',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    RatingBar.builder(
                      itemSize: 20,
                      initialRating: product.rate,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(
                        horizontal: 2.0,
                      ),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Spacer(),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: GestureDetector(
                        key: Key("addProductToCart"),
                        onTap: () => addProductInCart(context),
                        child: Text(
                          'Add carrinho',
                          style: TextStyle(
                            color: Colors.blue,
                            decorationColor: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
