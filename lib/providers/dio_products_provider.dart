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
    _dio.interceptors.add(LogInterceptor(
      responseBody: false,
    ));
  }

  Future<List<Product>> getProducts() async {
    final response = await _dio.get("/products/category/men's clothing");
    return (response.data as List)
        .map((postJson) => Product.fromJson(postJson))
        .toList();
  }
}
