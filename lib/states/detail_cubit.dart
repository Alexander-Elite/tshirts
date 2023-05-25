import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirts/models/product.dart';

class DetailCubit extends Cubit<Product?> {
  DetailCubit() : super(null);

  void view(Product model) {
    emit(model);
  }
}
