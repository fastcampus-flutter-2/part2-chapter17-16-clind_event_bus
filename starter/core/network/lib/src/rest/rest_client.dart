import 'package:dio/dio.dart';

const Duration receiveTimeout = Duration(minutes: 1);
const Duration sendTimeout = Duration(minutes: 1);
const Duration connectTimeout = Duration(minutes: 1);

class RestClient {
  late Dio _dio;

  RestClient({
    required String baseUrl,
    Map<String, dynamic>? headers,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: headers,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
            connectTimeout: connectTimeout,
          ),
        );

  BaseOptions get options => _dio.options;

  void update({
    String? baseUrl,
    Map<String, dynamic>? headers,
  }) {
    final BaseOptions options = _dio.options.copyWith(
      baseUrl: baseUrl,
      headers: headers,
    );
    _dio = Dio(options);
  }

  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
