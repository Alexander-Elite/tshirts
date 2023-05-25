import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/theme.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product prod = Product.test();
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: ListView(
        children: [
          Text(prod.title),
          SizedBox(
            height: 100,
          ),
          Text(prod.title),
          SizedBox(
            height: 100,
          ),
          Text(prod.title),
          SizedBox(
            height: 100,
          ),
          Text(prod.title),
          SizedBox(
            height: 100,
          ),
          Text(prod.title),
          SizedBox(
            height: 100,
          ),
          Text(prod.title),
          SizedBox(
            height: 100,
          ),
        ],
      ),
      // color: Color(0xFFF7F9F9),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        height: 280,
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
                      "\$" + prod.price.toString(),
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
