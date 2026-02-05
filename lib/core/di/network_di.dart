import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:offline_first_design/core/network/api_client.dart';
import 'package:offline_first_design/data/models/product_model.dart';
import '../network/network_info.dart';
import 'service_locator.dart';

Future<void> initNetwork() async {
  sl.registerLazySingleton(() => Connectivity());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl()));

  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    return dio;
  });

  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  // --- HIVE BOX ---
  final productBox = await Hive.openBox<ProductModel>('products');

  sl.registerLazySingleton<Box<ProductModel>>(() => productBox);
}
