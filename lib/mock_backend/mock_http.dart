import '../core/api/api_exception.dart';

class MockRequest {
  const MockRequest({
    required this.method,
    required this.path,
    this.query = const {},
    this.body,
    this.bearerToken,
  });

  final String method;
  final String path;
  final Map<String, String> query;
  final Object? body;
  final String? bearerToken;

  Map<String, dynamic> get bodyMap =>
      body is Map<String, dynamic> ? body! as Map<String, dynamic> : const {};
}

class MockResponse {
  const MockResponse(this.status, [this.body]);

  const MockResponse.ok(Object? body) : this(200, body);

  const MockResponse.created(Object? body) : this(201, body);

  const MockResponse.noContent() : this(204);

  final int status;
  final Object? body;
}

class HttpError implements Exception {
  const HttpError(this.status, this.code, this.message, [this.errors = const {}, this.extra = const {}]);

  factory HttpError.validation(Map<String, List<String>> errors) => HttpError(
        422,
        ApiErrorCode.validation,
        'Certaines données sont invalides.',
        errors,
      );

  factory HttpError.notFound([String message = 'Ressource introuvable.']) =>
      HttpError(404, ApiErrorCode.notFound, message);

  factory HttpError.unauthenticated() =>
      const HttpError(401, ApiErrorCode.unauthenticated, 'Vous devez être connecté.');

  final int status;
  final ApiErrorCode code;
  final String message;
  final Map<String, List<String>> errors;
  final Map<String, Object?> extra;

  MockResponse toResponse() => MockResponse(status, {
        'message': message,
        'errors': errors,
        'code': code.wire,
        ...extra,
      });
}

typedef MockHandler = MockResponse Function(MockRequest request, Map<String, String> params);

class MockRoute {
  MockRoute(this.method, String pattern, this.handler)
      : pattern = pattern,
        _regex = RegExp(
          '^${pattern.replaceAllMapped(RegExp(r'\{(\w+)\}'), (m) => '(?<${m[1]}>[^/]+)')}\$',
        );

  final String method;
  final String pattern;
  final MockHandler handler;
  final RegExp _regex;

  Map<String, String>? match(String method, String path) {
    if (method != this.method) return null;
    final m = _regex.firstMatch(path);
    if (m == null) return null;
    return {for (final name in m.groupNames) name: m.namedGroup(name)!};
  }
}

class Validator {
  final Map<String, List<String>> errors = {};

  void add(String field, String message) => errors.putIfAbsent(field, () => []).add(message);

  bool get hasErrors => errors.isNotEmpty;

  void throwIfInvalid() {
    if (hasErrors) throw HttpError.validation(errors);
  }

  String? requiredString(Map<String, dynamic> body, String field, String label, {int max = 255}) {
    final value = body[field];
    if (value is! String || value.trim().isEmpty) {
      add(field, 'Le champ $label est obligatoire.');
      return null;
    }
    if (value.length > max) {
      add(field, 'Le champ $label ne doit pas dépasser $max caractères.');
      return null;
    }
    return value.trim();
  }

  String? optionalString(Map<String, dynamic> body, String field, String label, {int max = 255}) {
    final value = body[field];
    if (value == null) return null;
    if (value is! String) {
      add(field, 'Le champ $label doit être un texte.');
      return null;
    }
    if (value.length > max) {
      add(field, 'Le champ $label ne doit pas dépasser $max caractères.');
      return null;
    }
    return value;
  }

  String? id(Map<String, dynamic> body, String field, String label, {bool required = true}) {
    final value = body[field];
    if (value == null) {
      if (required) add(field, 'Le champ $label est obligatoire.');
      return null;
    }
    if (value is int) return '$value';
    if (value is String && value.isNotEmpty) return value;
    add(field, 'Le champ $label est invalide.');
    return null;
  }
}

final uuidPattern = RegExp(
  r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
);

final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
