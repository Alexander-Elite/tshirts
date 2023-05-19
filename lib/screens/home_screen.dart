import 'package:flutter/material.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/theme.dart';
import 'package:tshirts/widgets/head1.dart';
import 'package:tshirts/widgets/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Product prod = Product.test();
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Head1(),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (BuildContext context, int index) => MyProduct(
                      product: prod,
                      onAdd: () {},
                    ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(color: Colors.transparent),
                itemCount: 15),
          ),
        ],
      ),
    );
  }
}
