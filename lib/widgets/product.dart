import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/theme.dart';

class MyProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;
  final bool cols;

  const MyProduct({
    Key? key,
    required this.product,
    required this.onAdd,
    required this.cols,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (cols)
        ? Product1Widget(
            product: product,
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Product2Widget(
                product: product,
              ),
              // Product2Widget(product: product,),
              const SizedBox(
                height: 35,
              ),
            ],
          );
  }
}

class Product1Widget extends StatelessWidget {
  const Product1Widget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

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
                  style: ThemeFonts.productTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(product.description.toUpperCase(),
                    style: ThemeFonts.productDescr),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text("\$${product.price}", style: ThemeFonts.r16),
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

class Product2Widget extends StatelessWidget {
  const Product2Widget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // width: width2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              AutoRouter.of(context).pushNamed('/product');
            },
            child: SizedBox(
              height: 162,
              child: Positioned.fill(
                child: Image.network(
                  product.thumbnail,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            product.title.toUpperCase(),
            style: ThemeFonts.productTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(product.description.toUpperCase(),
              style: ThemeFonts.productDescr),
          const SizedBox(
            height: 12,
          ),
          Row(children: [
            Text("\$" + product.price.toString(), style: ThemeFonts.r16),
            const SizedBox(
              width: 30,
            ),
            const Text(
              "ADD TO CART",
              style: ThemeFonts.productAddToCart,
            ),
          ]),
        ],
      ),
    );
  }
}
