import 'package:flutter/material.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/theme.dart';

class AlsoLike extends StatelessWidget {
  final Product prod;
  AlsoLike({super.key, required this.prod});

  @override
  Widget build(BuildContext context) {
    final Product prod = Product.test();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 168,
        width: 168,
        child: Image.network(
          prod.image,
          width: 148,
          height: 148,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          const Text(
            "Brasil Home 2018",
            style: ThemeFonts.r16,
          ),
        ],
      ),
      Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Text(
            "\$${prod.price}",
            style: ThemeFonts.AlsoLikePrice,
          ),
        ],
      ),
    ]);
  }
}
