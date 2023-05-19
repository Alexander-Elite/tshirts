import 'package:flutter/material.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/theme.dart';

class MyProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const MyProduct({
    Key? key,
    required this.product,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // clipBehavior: Clip.hardEdge,

      // elevation: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 112,
            child: Positioned.fill(
              child: Image.network(
                product.thumbnail,
                height: 112,
                width: 112,
                alignment: Alignment.centerLeft,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title.toUpperCase(),
                style: ThemeFonts.product_title,
                // overflow: TextOverflow.visible,
                softWrap: true,
              ),
              SizedBox(
                height: 6,
              ),
              Text(product.description.toUpperCase(),
                  style: ThemeFonts.product_descr),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
