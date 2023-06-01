import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/states/catalog_view_cubit.dart';
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
        children: [
          Head1(),
          Expanded(
            child: BlocBuilder<ProductCubit, Map<String, List<Product>>>(
              builder: (context, state) {
                return BlocBuilder<CatalogViewCubit, bool>(
                  builder: (context, state2) {
                    List<Widget> child = [];
                    if (state.containsKey("search")) {
                      child = state['search']!
                          .map(
                            (e) => MyProduct(
                              product: e,
                              cols: state2,
                            ),
                          )
                          .toList();
                    }
                    return state2
                        ? ListView(
                            padding: const EdgeInsets.all(16),
                            children: child,
                          )
                        : GridView(
                            padding: const EdgeInsets.all(16),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.6,
                            ),
                            children: child,
                          );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
