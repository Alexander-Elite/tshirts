import 'package:flutter/material.dart';
import 'package:tshirts/theme.dart';

class Qty extends StatefulWidget {
  int qt;

  Qty({required this.qt, super.key});

  @override
  State<Qty> createState() => _QtyState();
}

class _QtyState extends State<Qty> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 200,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          const Text(
            "Qty",
            style: ThemeFonts.r16,
          ),
          const SizedBox(
            width: 19,
          ),
          InkWell(
            onTap: () {
              if (widget.qt > 1) {
                setState(() {
                  widget.qt--;
                });
              }
            },
            child: Container(
              height: 40,
              width: 44,
              decoration: BoxDecoration(
                color: (widget.qt == 1)
                    ? const Color(0x66ECEFF1)
                    : const Color(0xFFECEFF1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Image.asset(
                "images/-.png",
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
            child: Text(
              widget.qt.toString(),
              textAlign: TextAlign.center,
              style: ThemeFonts.productDetailQ,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.qt++;
              });
            },
            child: Container(
              height: 40,
              width: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFECEFF1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Image.asset("images/+.png", alignment: Alignment.center),
            ),
          ),
        ],
      ),
    );
  }
}
