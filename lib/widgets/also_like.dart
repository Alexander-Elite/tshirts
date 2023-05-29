import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/states/detail_cubit.dart';
import 'package:tshirts/theme.dart';

class AlsoLike extends StatelessWidget {
  final Product prod;
  const AlsoLike({super.key, required this.prod});

  @override
  Widget build(BuildContext context) {
    //final Product prod = Product.test();
    return InkWell(
      onTap: () {
        BlocProvider.of<DetailCubit>(context).view(prod);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: 180,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 168,
            width: 168,
            child: Image.network(
              prod.image,
              alignment: Alignment.center,
              width: 148,
              height: 148,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 145,
                child: Text(
                  prod.title,
                  style: ThemeFonts.r16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Text(
                "\$${prod.price}",
                style: ThemeFonts.AlsoLikePrice,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
