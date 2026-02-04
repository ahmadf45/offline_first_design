import 'package:offline_first_design/data/mapper/product_mapper.dart';
import 'package:offline_first_design/entities/product.dart';
import 'package:offline_first_design/infrastructures/api_service_interface.dart';
import 'package:offline_first_design/infrastructures/misc/endpoints.dart';

class ProductRepository {
  ProductRepository(
    ApiServiceInterface service,
    Endpoints endpoints,
    ProductMapper mapper,
  ) {
    _service = service;
    _endpoints = endpoints;
    _mapper = mapper;
  }

  late ApiServiceInterface _service;
  late Endpoints _endpoints;
  late ProductMapper _mapper;

  Future<List<Product>> getProducts(Map<String, String> params) async {
    dynamic resp;
    try {
      await Future.delayed(Duration(milliseconds: 300));
      resp = await _service.invokeHttpList(
        _endpoints.product(),
        RequestType.get,
      );
    } catch (error) {
      rethrow;
    }
    return _mapper.getProducts(resp);
  }
}
