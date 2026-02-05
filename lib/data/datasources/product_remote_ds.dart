// data/datasources/product_remote_datasource.dart
import 'package:dio/dio.dart';
import 'package:offline_first_design/core/error/exceptions.dart';
import 'package:offline_first_design/core/network/api_client.dart';
import 'package:offline_first_design/data/models/product_model.dart';
import 'package:offline_first_design/domain/entities/product.dart';

abstract class ProductRemoteDataSourceInterface {
  Future<List<Product>> getProducts();
}

class ProductRemoteDataSource implements ProductRemoteDataSourceInterface {
  final ApiClient apiClient;

  ProductRemoteDataSource(this.apiClient);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await apiClient.get('/products');

      final data = response.data as List;
      return data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }
      throw ServerException(e.message ?? 'Server error');
    }
  }
}
