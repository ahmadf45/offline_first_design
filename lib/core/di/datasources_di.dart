import 'package:offline_first_design/data/datasources/product_local_ds.dart';
import 'package:offline_first_design/data/datasources/product_remote_ds.dart';
import 'service_locator.dart';

Future<void> initDatasource() async {
  sl.registerLazySingleton(() => ProductLocalDataSource(sl()));
  sl.registerLazySingleton(() => ProductRemoteDataSource(sl()));
}
