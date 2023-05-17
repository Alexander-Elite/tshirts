import 'package:flutter/material.dart';
import 'package:tshirts/theme.dart';
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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Head1(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) => Column(children:[SizedBox(height: 16,), Text("asd"), SizedBox(height: 18,)]),
              separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.red),
              itemCount: 25),
          ),
        ],
      ),
    );
  }
}
