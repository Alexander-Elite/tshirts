import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/theme.dart';
import 'package:tshirts/widgets/qty.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product prod = Product.test();
    final List prods = [prod, prod, prod, prod];

    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: prods.map((e) => CCard(prod: e)).toList(),
        ),
      ),
      // color: Color(0xFFF7F9F9),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        height: 270,
        child: Column(
          children: [
            Container(
              color: const Color(0xFFF7F9F9),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(children: [
                Row(
                  children: [
                    const Text(
                      "Subtotal",
                      style: ThemeFonts.cart1,
                    ),
                    const Expanded(
                      child: Text(""),
                    ),
                    Text(
                      "\$${prod.price}",
                      style: ThemeFonts.cart1,
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Shipping",
                      style: ThemeFonts.cart1,
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Text("-")
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Taxes",
                      style: ThemeFonts.cart1,
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Text("-")
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Total",
                      style: ThemeFonts.cart2,
                    ),
                    const Expanded(
                      child: Text(""),
                    ),
                    Text(
                      "\$${prod.price}",
                      style: ThemeFonts.cart2,
                    )
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  child: const Text(
                    "BACK",
                    style: ThemeFonts.cartBack,
                  ),
                ),
                const Expanded(child: Text("")),
                Container(
                  height: 40,
                  width: 244,
                  alignment: Alignment.center,
                  decoration: ThemeFonts.cyanButton,
                  child: const Text(
                    "CONTINUE TO CHECKOUT",
                    style: ThemeFonts.cyanButtonText,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CCard extends StatelessWidget {
  final Product prod;
  const CCard({required this.prod, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
                width: 56,
                child: Image.network(prod.image),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prod.title.toUpperCase(),
                      style: ThemeFonts.r16,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      prod.description,
                      style: ThemeFonts.productDescr,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
              const Expanded(child: Text("")),
              SvgPicture.asset(
                'images/recycle.svg',
                alignment: Alignment.topRight,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Qty(qt: 2),
              const Expanded(child: Text("")),
              Text(
                "\$${prod.price}",
                style: ThemeFonts.productDetailPrice,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
