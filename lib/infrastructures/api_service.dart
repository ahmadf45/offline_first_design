import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:offline_first_design/infrastructures/api_service_interface.dart';

class ApiService extends ApiServiceInterface {
  late Dio dio;
  late bool needThrowError;

  ApiService(Dio setDio) {
    dio = setDio;
    needThrowError = false;
  }

  /// Send http request
  @override
  Future<Map<String, dynamic>> invokeHttp(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    dynamic body,
    String? contentType,
    Map<String, String>? params,
    Encoding? encoding,
    bool needThrowError = true,
  }) async {
    Response response;
    this.needThrowError = needThrowError;
    try {
      response = await _invoke(
        url,
        type,
        headers: headers,
        body: jsonEncode(body),
        params: params,
      );
    } catch (error) {
      rethrow;
    }

    return response.data;
  }

  /// Send http request
  @override
  Future<List<dynamic>> invokeHttpList(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    dynamic body,
    String? contentType,
    Map<String, String>? params,
    Encoding? encoding,
    bool needThrowError = true,
  }) async {
    Response response;
    this.needThrowError = needThrowError;
    try {
      response = await _invoke(
        url,
        type,
        headers: headers,
        body: jsonEncode(body),
        params: params,
      );
    } catch (error) {
      rethrow;
    }

    return response.data;
  }

  /// Setup requiest type and configuration
  Future<Response> _invoke(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, String>? params,
  }) async {
    Response response;
    try {
      switch (type) {
        case RequestType.get:
          response = await dio.get(url, queryParameters: params);
          break;
        case RequestType.post:
          response = await dio.post(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.put:
          response = await dio.put(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.patch:
          response = await dio.patch(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.delete:
          response = await dio.delete(url, options: Options(headers: headers));
          break;
      }
      // inspect(response);

      if (response.statusCode != 200) {
        throw DioException(
          response: Response(
            statusCode: response.statusCode,
            data: {'message': response.statusMessage ?? ''},
            requestOptions: RequestOptions(
              data: {'message': response.statusMessage ?? ''},
              path: '',
            ),
            extra: (response.data['is_spam'] is bool)
                ? {'is_spam': response.data['is_spam']}
                : null,
          ),
          requestOptions: RequestOptions(
            data: {
              'message': response.data['message'],
              'origin': response.data['origin'],
              'data': response.data['data'],
            },
            path: '',
          ),
        );
      }
      return response;
    } on DioException catch (e) {
      notifyError(e.response, url);
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  void notifyError(Response? resp, dynamic url) {
    if (!needThrowError) return;

    /// to show every error from api
    // Utils().showErrorApiMessage(
    //     code: resp?.statusCode ?? 408,
    //     message: resp == null || resp.data is String
    //         ? 'Mohon coba lagi dalam beberapa saat.'
    //         : resp.data['message']);
  }
}
