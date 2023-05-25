import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/screens/cart_screen.dart';
import 'package:tshirts/screens/home_screen.dart';
import 'package:tshirts/screens/product_screen.dart';
import 'package:tshirts/screens/main_screen.dart';
part 'package:tshirts/auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: '/', children: [
          AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
          AutoRoute(page: ProductRoute.page, path: 'product'),
          AutoRoute(page: CartRoute.page, path: 'cart'),
        ])
      ];
}
