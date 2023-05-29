import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/states/cart_cubit.dart';
import 'package:tshirts/states/detail_cubit.dart';
import 'package:tshirts/theme.dart';

class MyProduct extends StatelessWidget {
  final Product product;
  final bool cols;

  const MyProduct({
    Key? key,
    required this.product,
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
        const SizedBox(
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
    return InkWell(
      onTap: () {
        BlocProvider.of<DetailCubit>(context).view(product);
        AutoTabsRouter.of(context).setActiveIndex(1);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 112,
            child: Positioned.fill(
              child: Image.network(
                product.image,
                height: 112,
                width: 112,
                alignment: Alignment.center,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
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
                    InkWell(
                      onTap: () {
                        BlocProvider.of<CartCubit>(context).add(product.id, 1);
                      },
                      child: InkWell(
                        child: const Text(
                          "ADD TO CART",
                          style: ThemeFonts.productAddToCart,
                        ),
                      ),
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
      child: InkWell(
        onTap: () {
          BlocProvider.of<DetailCubit>(context).view(product);
          AutoTabsRouter.of(context).setActiveIndex(1);
        },
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
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
              Text("\$${product.price}", style: ThemeFonts.r16),
              const Expanded(child: Text("")),
              InkWell(
                onTap: () {
                  BlocProvider.of<CartCubit>(context).add(product.id, 1);
                },
                child: const Text(
                  "ADD TO CART",
                  style: ThemeFonts.productAddToCart,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
