import 'dart:async';
import 'package:flutter/foundation.dart';

/// Base class to handle every use case in every single page
abstract class BaseUseCase<DOMAIN, REQUEST> extends ChangeNotifier {
  Future<DOMAIN> execute({required REQUEST request}) async {
    try {
      var data = await getData(request);
      return data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e');
        print('StackTrace: $stackTrace');
      }

      rethrow;
    }
  }

  Future<DOMAIN> getData(REQUEST request);
}
