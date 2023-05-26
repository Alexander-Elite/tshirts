import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

// для запуска генерации пишем: flutter packages pub run build_runner watch

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  // final List<String> kit = ['HOME', 'AWAY'];

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  factory Product.test() {
    return Product(
      id: 1,
      title: 'test Заголовок Заголовок Привет',
      description: 'Adidas',
      price: (245).toDouble(),
      category: "test",
      image:
          'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
    );
  }
}
