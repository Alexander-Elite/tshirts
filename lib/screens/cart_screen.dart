import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/states/cart_cubit.dart';
import 'package:tshirts/states/cart_price_cubit.dart';
import 'package:tshirts/states/productCubit.dart';
import 'package:tshirts/theme.dart';
import 'package:tshirts/widgets/qty.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: BlocBuilder<CartCubit, Map<String, int>>(
        builder: (context, state) {
          double summ = 0;
          var all = BlocProvider.of<ProductCubit>(context).state['all']
              as List<Product>;
          List<Product> prods = [];

          state.forEach((key, qty) {
            var newElement =
                all.where((element) => element.id == int.parse(key));
            prods.addAll(newElement);
            summ += newElement.first.price * qty;
          });

          BlocProvider.of<CartPriceCubit>(context).setSum(summ);

          // print(summ);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: prods
                  .map((e) => CCard(
                        prod: e,
                        qt: state[e.id.toString()]!,
                      ))
                  .toList(),
            ),
          );
        },
      ),
      // color: Color(0xFFF7F9F9),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        height: 280,
        child: BlocBuilder<CartPriceCubit, String>(builder: (context, state) {
          return Column(
            children: [
              Container(
                color: const Color(0xFFF7F9F9),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        state,
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
                        ////////////////////////////////////////////
                        state,
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
          );
        }),
      ),
    );
  }
}

class CCard extends StatelessWidget {
  final Product prod;
  final int qt;
  const CCard({required this.prod, super.key, required this.qt});

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
              InkWell(
                onTap: () {
                  BlocProvider.of<CartCubit>(context).remove(prod.id);
                },
                child: SvgPicture.asset(
                  'images/recycle.svg',
                  alignment: Alignment.topRight,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Qty(
                  qt: qt,
                  onTapMinus: () {
                    if (qt > 1) {
                      BlocProvider.of<CartCubit>(context)
                          .setQty(prod.id, (qt - 1));
                    }
                  },
                  onTapPlus: () {
                    BlocProvider.of<CartCubit>(context)
                        .setQty(prod.id, (qt + 1));
                  }),
              const Expanded(child: Text("")),
              Text(
                "\$ " + (prod.price * qt).toStringAsFixed(2),
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
