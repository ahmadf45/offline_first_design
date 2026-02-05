import 'package:offline_first_design/data/repositories/product_repository.dart';
import 'service_locator.dart';

Future<void> initRepositories() async {
  sl.registerLazySingleton(() => ProductRepository(sl(), sl(), sl()));
}
