import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tshirts/states/productCubit.dart';

import '../auto_route.dart';
import '../theme.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ProductCubit())
      ],
      child: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          ProductRoute(),
          CartRoute(),
        ],
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeColors.scaffold,
              elevation: 0,
              title: const Text(
                'FIFA World Cup Kits',
                style: ThemeFonts.r16,
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () => AutoRouter.of(context).pushNamed('/home'),
                color: ThemeColors.title2,
                icon: const Icon(Icons.menu),
              ),
              actions: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        AutoRouter.of(context).pushNamed('/cart');
                      },
                      icon: SvgPicture.asset(
                        'images/shape.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 12,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '2',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
            body: child, // const HomeScreen(),
            // bottomSheet: const BottomLine(),
            bottomNavigationBar: const BottomLine(),
          );
        },
      ),
    );
  }
}

class BottomLine extends StatelessWidget {
  const BottomLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFF263238),
      padding: const EdgeInsets.all(20),
      child: const Text(
        "© FIFA World Cup Kits 2018",
        style: TextStyle(color: Color(0xFFECEFF1), fontSize: 16),
      ),
    );
  }
}