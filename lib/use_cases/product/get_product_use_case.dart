import 'package:offline_first_design/data/repositories/product_repository.dart';
import 'package:offline_first_design/entities/product.dart';
import 'package:offline_first_design/infrastructures/base_use_case.dart';

class GetProductsUseCase
    extends BaseUseCase<List<Product>, Map<String, String>> {
  final ProductRepository _repository;

  GetProductsUseCase(this._repository);

  @override
  Future<List<Product>> getData(Map<String, String> request) {
    return _repository.getProducts(request);
  }
}
