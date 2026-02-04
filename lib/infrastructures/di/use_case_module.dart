import 'package:get_it/get_it.dart';
import 'package:offline_first_design/use_cases/product/get_product_use_case.dart';

/// Declare dependency injection for Use Case
class UseCaseModule {
  static void init(GetIt injector) {
    injector.registerFactory<GetProductsUseCase>(() {
      return GetProductsUseCase(injector.get());
    });
  }
}
