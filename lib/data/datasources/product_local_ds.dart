// data/datasources/product_local_datasource.dart
import 'package:hive_ce/hive.dart';
import 'package:offline_first_design/core/error/exceptions.dart';
import 'package:offline_first_design/data/models/product_model.dart';

abstract class ProductLocalDataSourceInterface {
  /// Get all cached products
  /// Throws [CacheException] if empty
  Future<List<ProductModel>> getCachedProducts();

  /// Get single product from cache
  /// Throws [CacheException] if not found
  Future<ProductModel> getProductById(int id);

  /// Save products to cache (replace all)
  Future<void> cacheProducts(List<ProductModel> products);

  /// Clear all cached data
  Future<void> clear();
}

class ProductLocalDataSource implements ProductLocalDataSourceInterface {
  final Box<ProductModel> box;

  ProductLocalDataSource(this.box);

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    if (box.isEmpty) {
      throw CacheException('No cached products available');
    }
    return box.values.toList();
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final product = box.get(id);
    if (product == null) {
      throw CacheException('Product not found');
    }
    return product;
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await box.clear();

    for (final product in products) {
      await box.put(product.id, product);
    }
  }

  @override
  Future<void> clear() async {
    await box.clear();
  }
}
