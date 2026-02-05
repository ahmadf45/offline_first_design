// domain/repositories/product_repository.dart
// import '../../core/result/result.dart';
import 'package:offline_first_design/core/results/results.dart';
import 'package:offline_first_design/domain/entities/product.dart';

abstract class ProductRepositoryInterface {
  Future<Result<List<Product>>> getProducts();

  Future<Result<Product>> getProductById(int id);

  Future<Result<void>> saveLocalProducts(List<Product> products);

  Future<Result<void>> clearLocalCache();
}
