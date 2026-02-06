import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:offline_first_design/domain/entities/product.dart';
import 'package:offline_first_design/domain/usecases/get_products_usecase.dart';

class ProductProvider extends ChangeNotifier {
  final GetProductsUsecase getProducts;

  ProductProvider(this.getProducts) {
    loadProducts(); // init state
  }

  bool isLoading = true;
  String? error;
  List<Product> products = [];

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final result = await getProducts();
    inspect(result);

    if (result.isSuccess) {
      products = result.data!;
    } else {
      error = result.failure!.message;
    }

    isLoading = false;
    notifyListeners();
  }
}
