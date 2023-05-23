import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/states/productCubit.dart';
import 'package:tshirts/theme.dart';
import 'package:tshirts/widgets/head1.dart';
import 'package:tshirts/widgets/product.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Head1(),
          Expanded(
            child: BlocBuilder<ProductCubit, List<Product>>(
              builder: (context, state) => GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                // ListView.separated(
                padding: const EdgeInsets.all(16),
                children: (state.isNotEmpty)
                    ? state
                        .map((e) =>
                            MyProduct(product: e, onAdd: () {}, cols: true))
                        .toList()
                    : [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*
prods
                  .map((e) => MyProduct(product: e, onAdd: () {}, cols: true))
                  .toList()
*/