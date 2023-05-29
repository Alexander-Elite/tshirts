import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/models/product.dart';
import 'package:tshirts/providers/dio_products_provider.dart';

class ProductCubit extends Cubit<Map<String, List<Product>>> {
  final _provider = DioProductsProvider();

  ProductCubit() : super({}) {
    loadProducts();
  }

  void loadProducts() async {
    List<Product> list = await _provider.getProducts();
    state['all'] = list;
    state['search'] = list;
    emit(state);
  }

  void search(String str) {
    Map<String, List<Product>> tmp = state;
    emit({});
    tmp['search'] = tmp['all']!
        .where((element) =>
            element.title.toUpperCase().contains(str.toUpperCase()))
        .toList();
    if (str == '') {
      tmp['search'] = tmp['all']!;
    }
    emit(tmp);
  }
}
