enum ApiErrorCode {
  validation('VALIDATION_ERROR'),
  unauthenticated('UNAUTHENTICATED'),
  forbidden('FORBIDDEN'),
  notFound('NOT_FOUND'),
  cursorExpired('CURSOR_EXPIRED'),
  rateLimited('RATE_LIMITED'),
  catalogUnavailable('CATALOG_UNAVAILABLE'),
  internal('INTERNAL_ERROR'),
  unknown('UNKNOWN');

  const ApiErrorCode(this.wire);

  final String wire;

  static ApiErrorCode fromWire(Object? value) =>
      values.firstWhere((c) => c.wire == value, orElse: () => unknown);

  static ApiErrorCode fromStatus(int status) => switch (status) {
        401 || 419 => unauthenticated,
        403 => forbidden,
        404 => notFound,
        410 => cursorExpired,
        429 => rateLimited,
        503 => catalogUnavailable,
        >= 500 => internal,
        >= 400 => validation,
        _ => unknown,
      };
}

class ApiException implements Exception {
  const ApiException({
    required this.statusCode,
    required this.code,
    required this.message,
    this.fieldErrors = const {},
    this.retryAfter,
  });

  factory ApiException.fromResponse(int statusCode, Object? body, {Duration? retryAfter}) {
    final json = body is Map<String, dynamic> ? body : const <String, dynamic>{};
    final rawErrors = json['errors'];
    final code = ApiErrorCode.fromWire(json['code']);
    return ApiException(
      statusCode: statusCode,
      code: code == ApiErrorCode.unknown ? ApiErrorCode.fromStatus(statusCode) : code,
      message: json['message'] as String? ?? '',
      retryAfter: retryAfter,
      fieldErrors: rawErrors is Map<String, dynamic>
          ? {
              for (final e in rawErrors.entries)
                if (e.value is List<dynamic>) e.key: [for (final m in e.value as List<dynamic>) m.toString()],
            }
          : const {},
    );
  }

  final int statusCode;
  final ApiErrorCode code;
  final String message;
  final Map<String, List<String>> fieldErrors;
  final Duration? retryAfter;

  String? firstErrorFor(String field) => fieldErrors[field]?.firstOrNull;

  bool get isTerminal => code == ApiErrorCode.validation || code == ApiErrorCode.forbidden;

  @override
  String toString() => 'ApiException($statusCode, ${code.wire}, $message)';
}

class NetworkUnavailableException implements Exception {
  const NetworkUnavailableException();

  @override
  String toString() => 'NetworkUnavailableException';
}
