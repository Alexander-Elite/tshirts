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
    return Column(
      children: [
        (cols)
            ? Product1Widget(
                product: product,
              )
            : Product2Widget(
                product: product,
              ),
        SizedBox(
          height: 25,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 112,
          child: Positioned.fill(
            child: Image.network(
              product.image,
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
              Text(product.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
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
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              AutoRouter.of(context).pushNamed('/product');
            },
            child: SizedBox(
              height: 162,
              width: 162,
              child: Positioned.fill(
                child: Image.network(
                  product.image,
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
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
          Text(
            product.description,
            style: ThemeFonts.productDescr,
            maxLines: 2,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(children: [
            const SizedBox(
              width: 12,
            ),
            Text("\$" + product.price.toString(), style: ThemeFonts.r16),
            const Expanded(child: Text("")),
            const Text(
              "ADD TO CART",
              style: ThemeFonts.productAddToCart,
            ),
            const SizedBox(
              width: 12,
            ),
          ]),
        ],
      ),
    );
  }
}
