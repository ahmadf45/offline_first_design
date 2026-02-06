import 'package:offline_first_design/core/network/network_info.dart';
import 'package:offline_first_design/core/results/results.dart';
import 'package:offline_first_design/data/datasources/product_local_ds.dart';
import 'package:offline_first_design/data/datasources/product_remote_ds.dart';
import 'package:offline_first_design/domain/repositories/product_repository_interface.dart';
import 'package:offline_first_design/domain/entities/product.dart';

import '../../core/error/error_mapper.dart';
import '../models/product_model.dart';

class ProductRepository implements ProductRepositoryInterface {
  final ProductRemoteDataSource remote;
  final ProductLocalDataSource local;
  final NetworkInfo networkInfo;

  ProductRepository(this.remote, this.local, this.networkInfo);

  @override
  Future<Result<List<Product>>> getProducts() async {
    try {
      if (await networkInfo.isConnected) {
        // ONLINE
        final products = await remote.getProducts();

        await local.cacheProducts(
          products.map(ProductModel.fromEntity).toList(),
        );

        return Result.success(products);
      } else {
        // OFFLINE
        final cached = await local.getCachedProducts();
        return Result.success(cached.map((e) => e.toEntity()).toList());
      }
    } catch (e) {
      return Result.failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Product>> getProductById(int id) async {
    try {
      final model = await local.getProductById(id);
      return Result.success(model.toEntity());
    } catch (e) {
      return Result.failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> saveLocalProducts(List<Product> products) async {
    try {
      await local.cacheProducts(products.map(ProductModel.fromEntity).toList());
      return Result.success(null);
    } catch (e) {
      return Result.failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> clearLocalCache() async {
    try {
      await local.clear();
      return Result.success(null);
    } catch (e) {
      return Result.failure(ErrorMapper.map(e));
    }
  }
}
