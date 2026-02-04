import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:offline_first_design/infrastructures/misc/endpoints.dart';

import '../api_service.dart';
import '../api_service_interface.dart';

/// Commonly here to declare dependency injection
class RootModule {
  static Future<void> init(GetIt injector) async {
    injector.registerLazySingleton<Endpoints>(
      () => Endpoints("http://localhost:3000"),
    );

    injector.registerFactory<Dio>(() {
      var dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 60);
      dio.options.receiveTimeout = const Duration(seconds: 60);
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['X_FORWARDED_PROTO'] = 'HTTPS';
      dio.options.headers['HTTPS'] = 'ON';

      var endpoints = injector.get<Endpoints>();

      // use for log response and request data
      if (kDebugMode || kProfileMode) {
        dio.interceptors.add(
          LogInterceptor(
            requestBody: true,
            responseBody: true,
            requestHeader: true,
            responseHeader: false,
            request: true,
          ),
        );
      }

      // if you want to use Chucker as interceptor, just uncomment this line
      // dio.interceptors.add(ChuckerDioInterceptor());

      dio.options.baseUrl = endpoints.baseUrl;
      return dio;
    });

    injector.registerFactory<ApiServiceInterface>(() {
      return ApiService(injector.get());
    });

    // if you want to use env file, just uncomment this line
    // injector.registerFactory<Endpoints>(() {
    //   return Endpoints(dotenv.env['BASE_URL'] ?? '');
    // });
  }
}
