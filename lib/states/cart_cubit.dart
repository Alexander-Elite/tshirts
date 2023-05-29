import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/providers/cart_provider.dart';

class CartCubit extends Cubit<Map<String, int>> {
  final _provider = CartProvider();
  CartCubit() : super({}) {
    _getCart();
  }

  void _getCart() async {
    var tmp = await _provider.getCart();
    emit(tmp);
  }

  Future<String> getSumm() async
  {
    return "0";
  }

  void add(int id, int qty) async {
    await _provider.add(id, qty);
    _getCart();
  }

  void remove(int id) async {
    await _provider.remove(id);
    _getCart();
  }

  void setQty(int id, int qty) async {
    await _provider.setQty(id, qty);
    _getCart();
  }
}
