import 'package:offline_first_design/core/results/results.dart';
import 'package:offline_first_design/data/repositories/product_repository.dart';

import '../entities/product.dart';

class GetProductByIdUseCase {
  final ProductRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<Result<Product>> call(int id) {
    return repository.getProductById(id);
  }
}
