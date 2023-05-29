import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/auto_route.dart';
import 'package:tshirts/states/cart_cubit.dart';
import 'package:tshirts/states/catalog_view_cubit.dart';
import 'package:tshirts/states/detail_cubit.dart';
import 'package:tshirts/states/productCubit.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ProductCubit()),
        BlocProvider(create: (BuildContext context) => CatalogViewCubit()),
        BlocProvider(create: (BuildContext context) => DetailCubit()),
        BlocProvider(create: (BuildContext context) => CartCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
