import 'package:dio/dio.dart';

import 'api_client.dart';
import 'api_exception.dart';

class DioTransport implements ApiTransport {
  DioTransport({required String baseUrl, Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 20),
              headers: const {'Accept': 'application/json', 'Accept-Language': 'fr'},
              validateStatus: (_) => true,
              responseType: ResponseType.json,
            ));

  final Dio _dio;

  @override
  Future<ApiResponse> send(ApiRequest request) async {
    try {
      final response = await _dio.request<Object?>(
        request.path,
        data: request.body,
        queryParameters: request.query.isEmpty ? null : request.query,
        options: Options(
          method: request.method,
          contentType: request.body == null ? null : Headers.jsonContentType,
          headers: {
            if (request.bearerToken != null) 'Authorization': 'Bearer ${request.bearerToken}',
          },
        ),
      );
      final retryAfter = int.tryParse(response.headers.value('retry-after') ?? '');
      final body = response.data;
      return ApiResponse(
        response.statusCode ?? 500,
        body is String && body.isEmpty ? null : body,
        retryAfter == null ? null : Duration(seconds: retryAfter),
      );
    } on DioException catch (e) {
      if (e.response == null) throw const NetworkUnavailableException();
      rethrow;
    }
  }
}
