import 'package:dio/dio.dart';
import 'package:tshirts/models/product.dart';

class DioProductsProvider // implements ProductsProvider
{
  // final _dio = Dio(
  //   BaseOptions( baseUrl: 'https://dummyjson.com' )
  // );
  late final Dio _dio;

  // https://fakestoreapi.com/products

  DioProductsProvider() {
    _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));
  }

  Future<List<Product>> getProducts() async {
    final response = await _dio.get("/products"); // /category/men's clothing
    return (response.data as List)
        .map((postJson) => Product.fromJson(postJson))
        .toList()
        .where((element) => element.category.contains("clothing"))
        .toList();
  }
}
