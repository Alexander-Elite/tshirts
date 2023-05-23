import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/providers/dio_products_provider.dart';

class ProductCubit extends Cubit<List<Product>> {
  final _provider = DioProductsProvider();

  ProductCubit() : super([]) {
    loadProducts();
  }

  void loadProducts() async {
    List<Product> list = await _provider.getProducts();
    print(list);
    emit(list);
  }
}
