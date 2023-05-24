import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tshirts/states/catalog_view_cubit.dart';
import 'package:tshirts/theme.dart';
import 'package:tshirts/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/widgets/product.dart';

class Head1 extends StatelessWidget {
  Head1({Key? key}) : super(key: key);
  final _titleController = TextEditingController();

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
        BlocBuilder<CatalogViewCubit, bool>(
          builder: (context, state) {
            CatalogViewCubit _cvc = context.watch<CatalogViewCubit>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'images/sort1a.svg',
                        color:
                            _cvc.state ? Color(0xFF455A64) : Color(0xFF90A4AE),
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // AutoTabsRouter.of(context).setActiveIndex(2);
                        _cvc.set(true);
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'images/sort2a.svg',
                        /*width: 20, height: 20,*/
                        color:
                            _cvc.state ? Color(0xFF90A4AE) : Color(0xFF455A64),
                      ),
                      onPressed: () {
                        _cvc.set(false);
                      },
                      padding: EdgeInsets.zero,
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
            );
          },
        ),
      ],
    );
  }
}
