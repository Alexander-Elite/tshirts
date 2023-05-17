import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tshirts/theme.dart';
import 'package:tshirts/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/widgets/product.dart';

class Head1 extends StatefulWidget {
  const Head1({Key? key}) : super(key: key);
  @override
  State<Head1> createState() => _Head1State();
}

class _Head1State extends State<Head1> {
  final _titleController = TextEditingController();

  @override
  void initState() {
    // _titleController.text = widget.toString() ?? '';
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Authentic World Cup Kits",
                style: ThemeFonts.r22,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.search, color: ThemeColors.title2),
                    hintText: 'Search Kits',
                    hintStyle: TextStyle(color: ThemeColors.srchint),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(100, 128, 128, 128)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(100, 128, 128, 128)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'images/sort1a.svg', /*width: 20, height: 20,*/
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  // iconSize: 8,
                  // visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'images/sort2i.svg', /*width: 20, height: 20,*/
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  // iconSize: 8,
                  // visualDensity: VisualDensity.compact,
                ),
                Expanded(child: Container()),
                const Text('FILTER', style: ThemeFonts.sorts),
                const SizedBox(
                  width: 27,
                ),
                const Text('SORT', style: ThemeFonts.sorts),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

