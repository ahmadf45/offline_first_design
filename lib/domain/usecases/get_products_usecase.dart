// domain/usecases/get_products.dart
import 'package:offline_first_design/core/results/results.dart';
import 'package:offline_first_design/data/repositories/product_repository.dart';

import '../entities/product.dart';

class GetProductsUsecase {
  final ProductRepository repository;

  GetProductsUsecase(this.repository);

  Future<Result<List<Product>>> call() {
    return repository.getProducts();
  }
}
