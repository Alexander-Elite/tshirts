import 'package:flutter/material.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/theme.dart';

class MyProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const MyProduct({
    Key? key,
    required this.product,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 112,
            child: Positioned.fill(
              child: Image.network(
                product.thumbnail,
                height: 112,
                width: 112,
                alignment: Alignment.centerLeft,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title.toUpperCase(),
                  style: ThemeFonts.product_title,
                  // overflow: TextOverflow.visible,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(product.description.toUpperCase(),
                    style: ThemeFonts.product_descr),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text("\$" + product.price.toString(),
                        style: ThemeFonts.r16),
                    Expanded(
                      child: Container(),
                    ),
                    const Text(
                      "ADD TO CART",
                      style: ThemeFonts.productAddToCart,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
