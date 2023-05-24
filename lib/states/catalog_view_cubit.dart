import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogViewCubit extends Cubit<bool> {
  CatalogViewCubit() : super(false);

  void set(bool type) {
    emit(type);
  }
}
