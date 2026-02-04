import 'package:get_it/get_it.dart';
import 'package:offline_first_design/data/mapper/product_mapper.dart';

/// Declare dependency injection for Mapper
class MapperModule {
  static void init(GetIt injector) {
    injector.registerFactory<ProductMapper>(() {
      return ProductMapper();
    });
  }
}
