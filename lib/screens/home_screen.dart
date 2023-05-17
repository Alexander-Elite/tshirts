import 'package:flutter/material.dart';
import 'package:tshirts/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tshirts/widgets/head1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      appBar: AppBar(
        backgroundColor: ThemeColors.scaffold,
        elevation: 0,
        title: const Text(
          'FIFA World Cup Kits',
          style: ThemeFonts.r16,
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: ThemeColors.title2,
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {},
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
                  // BlocBuilder<CartCubit, Cart> (
                  //   builder: (context, Cart cart) {
                  //     return Text(
                  //     cart.products.length.toString(),
                  //     );
                  //   },
                  // ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),

          // const Icon( Icons.shopping_cart, color: ThemeColors.title2),
        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Head1(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => Column(children:[SizedBox(height: 16,), Text("asd"), SizedBox(height: 16,)]),
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemCount: 25),
          )
        ],
      ),
    );
  }
}
