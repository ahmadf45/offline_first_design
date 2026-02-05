import 'package:offline_first_design/domain/usecases/clear_products_cache_usecase.dart';
import 'package:offline_first_design/domain/usecases/get_product_by_id_usecase.dart';
import 'package:offline_first_design/domain/usecases/get_products_usecase.dart';
import 'package:offline_first_design/domain/usecases/save_product_usecase.dart';
import 'service_locator.dart';

Future<void> initUsecases() async {
  sl.registerLazySingleton(() => GetProductsUsecase(sl()));
  sl.registerLazySingleton(() => GetProductByIdUseCase(sl()));
  sl.registerLazySingleton(() => SaveProductsUseCase(sl()));
  sl.registerLazySingleton(() => ClearProductsCacheUsecase(sl()));
}
