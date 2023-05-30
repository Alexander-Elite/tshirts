// import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class CartProvider {
  Future<SharedPreferences> _getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<Map<String, int>> getCart() async {
    SharedPreferences prefs = await _getInstance();
    Set<String> keys = prefs.getKeys();
    Map<String, int> cart = {};
    keys.forEach((element) {
      cart[element] = prefs.getInt(element) ?? 0;
    });
    return cart;
  }

  Future<void> add(int id, int qty) async {
    SharedPreferences prefs = await _getInstance();
    prefs.setInt(id.toString(),
        qty); // Данный метод не должен вызываться при добавлении в корзину существующих в ней товаров, но для облегчения логики вот так
    await prefs.reload();
  }

  Future<void> setQty(int id, int qty) async {
    add(id, qty); // т.к. метод add - перезаписывает, так проще
  }

  Future<void> remove(int id) async {
    SharedPreferences prefs = await _getInstance();
    prefs.remove(id.toString());
  }
}
