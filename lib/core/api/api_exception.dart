enum ApiErrorCode {
  validation('VALIDATION_ERROR'),
  unauthenticated('UNAUTHENTICATED'),
  forbidden('FORBIDDEN'),
  notFound('NOT_FOUND'),
  conflict('CONFLICT'),
  rateLimited('RATE_LIMITED'),
  catalogUnavailable('CATALOG_UNAVAILABLE'),
  internal('INTERNAL_ERROR'),
  unknown('UNKNOWN');

  const ApiErrorCode(this.wire);

  final String wire;

  static ApiErrorCode fromWire(Object? value) =>
      values.firstWhere((c) => c.wire == value, orElse: () => unknown);
}

class ApiException implements Exception {
  const ApiException({
    required this.statusCode,
    required this.code,
    required this.message,
    this.fieldErrors = const {},
  });

  factory ApiException.fromResponse(int statusCode, Object? body) {
    final json = body is Map<String, dynamic> ? body : const <String, dynamic>{};
    final rawErrors = json['errors'];
    return ApiException(
      statusCode: statusCode,
      code: ApiErrorCode.fromWire(json['code']),
      message: json['message'] as String? ?? '',
      fieldErrors: rawErrors is Map<String, dynamic>
          ? {
              for (final e in rawErrors.entries)
                e.key: [for (final m in e.value as List<dynamic>) m.toString()],
            }
          : const {},
    );
  }

  final int statusCode;
  final ApiErrorCode code;
  final String message;
  final Map<String, List<String>> fieldErrors;

  String? firstErrorFor(String field) => fieldErrors[field]?.firstOrNull;

  @override
  String toString() => 'ApiException($statusCode, ${code.wire}, $message)';
}

class NetworkUnavailableException implements Exception {
  const NetworkUnavailableException();

  @override
  String toString() => 'NetworkUnavailableException';
}
