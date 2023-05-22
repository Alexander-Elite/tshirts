/* import 'package:dio/dio.dart';

class DioProductsProvider // implements ProductsProvider
{
  // final _dio = Dio(
  //   BaseOptions( baseUrl: 'https://dummyjson.com' )
  // );
  late final Dio _dio;

  // https://fakestoreapi.com/products

  DioProductsProvider()
  {
    _dio = Dio(   BaseOptions( baseUrl: 'https://fakestoreapi.com' )  );
    _dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
    ));
  }


  @override
  Future<List<ProductData>> getProducts() async
  {
    final response = await _dio.get('/posts');
    final list = response.data['posts'] as List;
    return list.map( (postJson) => ArticleData.fromJson(postJson) ).toList();
  }

} */