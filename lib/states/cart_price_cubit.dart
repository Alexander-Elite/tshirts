import 'package:flutter_bloc/flutter_bloc.dart';

class CartPriceCubit extends Cubit<String> {
  CartPriceCubit() : super("\$0");

  void setSum(double summ) {
    emit("\$${summ.toStringAsFixed(2)}");
  }
}
