import 'package:offline_first_design/core/results/results.dart';
import 'package:offline_first_design/data/repositories/product_repository.dart';

import '../entities/product.dart';

class SaveProductsUseCase {
  final ProductRepository repository;

  SaveProductsUseCase(this.repository);

  Future<Result<void>> call(List<Product> products) {
    return repository.saveLocalProducts(products);
  }
}
