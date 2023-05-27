import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/states/detail_cubit.dart';
import 'package:tshirts/states/productCubit.dart';
import 'package:tshirts/theme.dart';
import 'package:tshirts/widgets/also_like.dart';
import 'package:tshirts/widgets/qty.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  final Product? prod;
  const ProductScreen({Key? key, this.prod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Product prod = Product.test();
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: BlocBuilder<DetailCubit, Product?>(
        builder: (BuildContext context, prod) {
          List<Product> alsoo = [];
          if (prod != null) {
            final List<Product> all =
                BlocProvider.of<ProductCubit>(context).state;
            if (true /* prod != null */) {
              for (int i = 0; i < all.length; i++) {
                if (all[i].id != prod.id) {
                  alsoo.add(all[i]);
                }
              }
            }

            return ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 318,
                      child: Image.network(
                        prod.image,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: SvgPicture.string(
                          '<svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M11.6978 5.99606C11.6043 6.10043 11.4873 6.15261 11.3469 6.15261C11.2066 6.15261 11.0896 6.10043 10.9961 5.99606C10.8921 5.90212 10.8401 5.78471 10.8401 5.64381C10.8401 5.5029 10.8921 5.38549 10.9961 5.29155L15.269 1.01758H12.9142C12.8102 1.01758 12.7167 0.983662 12.6335 0.915821C12.5503 0.84798 12.5035 0.756656 12.4931 0.641848V0.391359C12.4931 0.286988 12.5295 0.198274 12.6023 0.125214C12.6751 0.0521543 12.7635 0.015625 12.8674 0.015625L16.4386 0.0312806H16.4542L16.6413 0.015625C16.6829 0.015625 16.7271 0.0260619 16.7738 0.0469362C16.8206 0.0678104 16.8596 0.0939027 16.8908 0.125214C16.922 0.156525 16.9454 0.193055 16.961 0.234803C16.9766 0.276551 16.9844 0.323518 16.9844 0.375703L16.9532 0.56357H16.961C16.9662 0.56357 16.9688 0.568789 16.9688 0.579226V4.19566C16.9584 4.2896 16.9168 4.36527 16.844 4.42267C16.7712 4.48007 16.6881 4.51399 16.5945 4.52443H16.3294C16.2254 4.52443 16.1397 4.48529 16.0721 4.40701C16.0045 4.32874 15.9707 4.24263 15.9707 4.1487L15.9863 1.72208L11.6978 5.99606ZM6.28652 10.0352C6.38009 9.93082 6.49704 9.87864 6.6374 9.87864C6.77775 9.87864 6.89471 9.93082 6.98827 10.0352C7.09224 10.1291 7.14422 10.2465 7.14422 10.3874C7.14422 10.5283 7.09224 10.6458 6.98827 10.7397L2.71537 15.0137H5.07015C5.17411 15.0137 5.26768 15.0476 5.35085 15.1154C5.43402 15.1833 5.4808 15.2746 5.4912 15.3894V15.6399C5.4912 15.7443 5.45481 15.833 5.38204 15.906C5.30926 15.9791 5.22089 16.0156 5.11693 16.0156L1.53018 16H1.51459L1.32745 16.0156C1.28587 16.0156 1.24169 16.0052 1.1949 15.9843C1.14812 15.9634 1.10913 15.9373 1.07794 15.906C1.04675 15.8747 1.02336 15.8382 1.00777 15.7964C0.992172 15.7547 0.984375 15.7077 0.984375 15.6555L1.01556 15.4677H1.00777C1.00257 15.4677 0.99997 15.4625 0.99997 15.452V11.8356C1.01037 11.7417 1.05195 11.666 1.12473 11.6086C1.1975 11.5512 1.28067 11.5173 1.37424 11.5068H1.65494C1.7589 11.5068 1.84467 11.546 1.91225 11.6242C1.97983 11.7025 2.01361 11.7886 2.01361 11.8826L1.99802 14.3092L6.28652 10.0352ZM16.9688 15.452C16.9688 15.4625 16.9662 15.4677 16.961 15.4677H16.9532L16.9844 15.6555C16.9844 15.7077 16.9766 15.7547 16.961 15.7964C16.9454 15.8382 16.922 15.8747 16.8908 15.906C16.8596 15.9373 16.8206 15.9634 16.7738 15.9843C16.7271 16.0052 16.6829 16.0156 16.6413 16.0156L16.4542 16H16.4386L12.8674 16.0156C12.7635 16.0156 12.6751 15.9791 12.6023 15.906C12.5295 15.833 12.4931 15.7443 12.4931 15.6399V15.3894C12.5035 15.2746 12.5503 15.1833 12.6335 15.1154C12.7167 15.0476 12.8102 15.0137 12.9142 15.0137H15.269L10.9961 10.7397C10.8921 10.6458 10.8401 10.5283 10.8401 10.3874C10.8401 10.2465 10.8921 10.1291 10.9961 10.0352C11.0896 9.93082 11.2066 9.87864 11.3469 9.87864C11.4873 9.87864 11.6043 9.93082 11.6978 10.0352L15.9863 14.3092L15.9707 11.8826C15.9707 11.7886 16.0045 11.7025 16.0721 11.6242C16.1397 11.546 16.2254 11.5068 16.3294 11.5068H16.5945C16.6881 11.5173 16.7712 11.5512 16.844 11.6086C16.9168 11.666 16.9584 11.7417 16.9688 11.8356V15.452ZM2.71537 1.01758L6.98827 5.29155C7.09224 5.38549 7.14422 5.5029 7.14422 5.64381C7.14422 5.78471 7.09224 5.90212 6.98827 5.99606C6.89471 6.10043 6.77775 6.15261 6.6374 6.15261C6.49704 6.15261 6.38009 6.10043 6.28652 5.99606L1.99802 1.72208L2.01361 4.1487C2.01361 4.24263 1.97983 4.32874 1.91225 4.40701C1.84467 4.48529 1.7589 4.52443 1.65494 4.52443H1.37424C1.28067 4.51399 1.1975 4.48007 1.12473 4.42267C1.05195 4.36527 1.01037 4.2896 0.99997 4.19566V0.579226C0.99997 0.568789 1.00257 0.56357 1.00777 0.56357C1.01297 0.56357 1.01556 0.56357 1.01556 0.56357L0.984375 0.375703C0.984375 0.323518 0.992172 0.276551 1.00777 0.234803C1.02336 0.193055 1.04675 0.156525 1.07794 0.125214C1.10913 0.0939027 1.14812 0.0678104 1.1949 0.0469362C1.24169 0.0260619 1.28587 0.015625 1.32745 0.015625L1.51459 0.0312806C1.51459 0.0312806 1.51719 0.0312806 1.52239 0.0312806C1.52758 0.0312806 1.53018 0.0312806 1.53018 0.0312806L5.11693 0.015625C5.22089 0.015625 5.30926 0.0521543 5.38204 0.125214C5.45481 0.198274 5.4912 0.286988 5.4912 0.391359V0.641848C5.4808 0.756656 5.43402 0.84798 5.35085 0.915821C5.26768 0.983662 5.17411 1.01758 5.07015 1.01758H2.71537Z" fill="#78909C"/>              </svg> '),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(prod.title,
                        style: ThemeFonts.productDetailTitle,
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        prod.description,
                        style: ThemeFonts.productDescr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      "\$${prod.price.toInt()}",
                      style: ThemeFonts.productDetailPrice,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Divider(
                      height: 0.3,
                      color: Color.fromRGBO(127, 151, 163, 0.32),
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ButtonLine(
                        zag: "Size", btns: const ['S', 'M', 'L', 'XL', "XXL"]),
                    const SizedBox(
                      height: 32,
                    ),
                    ButtonLine(
                      zag: "Kit",
                      btns: const ['HOME', 'AWAY', 'THIRD'],
                      wWidth: 72,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Qty(qt: 1),
                      ],
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 34,
                        ),
                        const Text(
                          "Customize Your Jersey",
                          style: ThemeFonts.r16,
                        ),
                        const Expanded(child: Text("")),
                        SvgPicture.asset('images/v.svg'),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        //print("asdasd");
                      },
                      child: Container(
                        height: 40,
                        width: 311,
                        alignment: Alignment.center,
                        decoration: ThemeFonts.cyanButton,
                        child: const Text(
                          "ADD TO CART",
                          style: ThemeFonts.cyanButtonText,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      height: 2,
                      color: Color.fromRGBO(38, 50, 56, 0.12),
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 34,
                        ),
                        const Text(
                          "Product Details",
                          style: ThemeFonts.r16,
                        ),
                        const Expanded(child: Text("")),
                        SvgPicture.asset('images/v.svg'),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 34,
                        ),
                        const Text(
                          "Shipping & Returns",
                          style: ThemeFonts.r16,
                        ),
                        const Expanded(child: Text("")),
                        SvgPicture.asset('images/v.svg'),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      height: 2,
                      color: Color.fromRGBO(38, 50, 56, 0.12),
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "You May Also Like",
                          style: ThemeFonts.productDetailGray,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 240,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: alsoo.map((e) => AlsoLike(prod: e)).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class SizeBoxWidget extends StatelessWidget {
  final bool active;
  final String sizeIndex;
  final bool selected;
  final double wWidth;

  const SizeBoxWidget(
      {Key? key,
      this.active = true,
      required this.sizeIndex,
      this.wWidth = 44,
      this.selected = false})
      : super(key: key);

  get _color {
    var r = 0xFF455A64;
    if (!active) {
      r = 0x55455A64;
    }
    if (selected) {
      r = 0xFFFFFFFF;
    }
    return r;
  }

  get _bgcolor {
    var r = Colors.white;
    if (!active) {
      r = const Color.fromARGB(60, 236, 239, 241);
    }
    if (selected) {
      r = const Color(0xFF263238);
    }
    if (sizeIndex == '+' || sizeIndex == '-') {
      r = const Color(0xFFECEFF1);
    }

    return r;
  }

  get _borders {
    var w = 1.0;
    var c = const Color(0xFF90A4AE);

    if (!active || selected || sizeIndex == '-' || sizeIndex == '+') {
      w = 0;
      c = Colors.transparent;
    }
    return Border.all(
      width: w,
      color: c,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: wWidth,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _bgcolor,
        border: _borders,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(sizeIndex,
          style: TextStyle(
            color: Color(_color),
          )),
    );
  }
}

class ButtonLine extends StatefulWidget {
  final String zag;
  final List btns;
  final double wWidth;
  ButtonLine(
      {required this.zag, required this.btns, this.wWidth = 44, super.key });

  Map<String, bool> act0 = {};
  Map<String, bool> sel0 = {};
  // final Map act0 = {};

  @override
  State<ButtonLine> createState() => _ButtonLineState();
}

class _ButtonLineState extends State<ButtonLine> {
  _ButtonLineState();

@override
  void initState() {
    super.initState();
    for( final e in widget.btns) {
      widget.act0[e] =  Random().nextBool();
      widget.sel0[e] = false;
    }

  var set = false;

    widget.act0.forEach((key, value) {
      if (value)
        {
          if (!set)
            {
              widget.sel0[key] = true;
              set = true;
            }
        }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.zag,
          style: ThemeFonts.r16,
        ),
        const SizedBox(
          width: 12,
        ),
        SizedBox(
          height: 40,
          width: 350,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.btns
                .map((e) {
              return InkWell(
                onTap: (){
                  if ( widget.act0[e]! )
                  {
                    for( final a in widget.btns)
                    {
                      widget.sel0[a] = false;
                    }
                    widget.sel0[e] = true;
                  setState((){});
                  }
                },
                child: SizeBoxWidget(
                  sizeIndex: e,
                  wWidth: widget.wWidth,
                  active: widget.act0[e]!,
                  selected: widget.sel0[e]!,
                ),
              );       }
            ).toList(),
          ),
        ),
      ],
    );
  }
}
