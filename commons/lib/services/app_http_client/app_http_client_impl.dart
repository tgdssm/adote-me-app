import 'package:dependencies/dependencies.dart';

import 'app_http_client_service.dart';

class AppHttpClientDioServiceImpl implements IAppHttpClientService {
  final Dio _dio;

  AppHttpClientDioServiceImpl(this._dio);

  @override
  Future delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.delete(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  @override
  Future get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  @override
  Future post(
    String url,
    Map<String, dynamic> body, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? contentType,
  }) {
    return _dio.post(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers, contentType: contentType),
    );
  }

  @override
  Future put(
    String url,
    Map<String, dynamic> body, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? contentType,
  }) {
    return _dio.put(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        contentType: contentType,
      ),
    );
  }

  Future<void> addInterceptors(String token) async {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Authorization"] = "Bearer $token";
        options.headers["Accept"] = "*/*";
      },
    ));
  }
}
