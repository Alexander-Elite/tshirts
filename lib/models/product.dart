class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String thumbnail;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'],
    );
  }

  factory Product.test() {
    return Product(
      id: 1,
      title: 'test Заголовок Заголовок Привет',
      description: 'Adidas',
      price: (245).toDouble(),
      thumbnail: 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
    );
  }
}
