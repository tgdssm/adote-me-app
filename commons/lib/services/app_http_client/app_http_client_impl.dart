import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';

class AppHttpClientDioServiceImpl implements IAppHttpClientService {
  final Dio _dio;
  final UserProvider _user = UserProvider();

  AppHttpClientDioServiceImpl(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_user.hasUser) {
          options.headers["Authorization"] = "Bearer ${_user.userData.token}";
        }
        options.headers["Accept"] = "*/*";
        return handler.next(options);
      },
    ));
  }

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
