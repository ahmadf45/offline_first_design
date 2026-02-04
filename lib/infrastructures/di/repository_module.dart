import 'package:get_it/get_it.dart';
import 'package:offline_first_design/data/repositories/product_repository.dart';

/// Declare dependency injection for Repository
class RepositoryModule {
  static void init(GetIt injector) {
    injector.registerFactory<ProductRepository>(() {
      return ProductRepository(injector.get(), injector.get(), injector.get());
    });
  }
}
