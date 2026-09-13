// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_flutter/models/product_model.dart';
import 'package:practice_flutter/repositories/product/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final IProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial()) {
    getProducts();
  }

  Future<void> getProducts() async {
    emit(ProductLoading());

    try {
      final product = await repository.getProducts();

      emit(ProductSuccess(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
