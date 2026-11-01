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

  Map<String, dynamic> get bodyMap => body is Map<String, dynamic> ? body! as Map<String, dynamic> : const {};
}

class MockResponse {
  const MockResponse(this.status, [this.body, this.retryAfterSeconds]);

  const MockResponse.ok(Object? body) : this(200, body);

  const MockResponse.created(Object? body) : this(201, body);

  const MockResponse.noContent() : this(204);

  final int status;
  final Object? body;
  final int? retryAfterSeconds;
}

class HttpError implements Exception {
  const HttpError(this.status, this.code, this.message, [this.errors = const {}, this.retryAfterSeconds]);

  factory HttpError.validation(Map<String, List<String>> errors) =>
      HttpError(422, 'VALIDATION_ERROR', 'Les données fournies sont invalides.', errors);

  factory HttpError.field(String field, String message) => HttpError.validation({
        field: [message],
      });

  factory HttpError.notFound() => const HttpError(404, 'NOT_FOUND', 'Ressource introuvable.');

  factory HttpError.unauthenticated([String message = 'Authentification requise.']) =>
      HttpError(401, 'UNAUTHENTICATED', message);

  factory HttpError.rateLimited(int retryAfter) =>
      HttpError(429, 'RATE_LIMITED', 'Trop de requêtes. Veuillez réessayer plus tard.', const {}, retryAfter);

  factory HttpError.cursorExpired() => const HttpError(
        410,
        'CURSOR_EXPIRED',
        'Le curseur de synchronisation a expiré. Une synchronisation complète est nécessaire.',
      );

  final int status;
  final String code;
  final String message;
  final Map<String, List<String>> errors;
  final int? retryAfterSeconds;

  MockResponse toResponse() =>
      MockResponse(status, {'message': message, 'errors': errors, 'code': code}, retryAfterSeconds);
}

typedef MockHandler = MockResponse Function(MockRequest request, Map<String, String> params);

class MockRoute {
  MockRoute(this.method, this.pattern, this.handler)
      : _regex = RegExp('^${pattern.replaceAllMapped(RegExp(r'\{(\w+)\}'), (m) => '(?<${m[1]}>[^/]+)')}\$');

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

  void throwIfInvalid() {
    if (errors.isNotEmpty) throw HttpError.validation(errors);
  }

  String? string(Map<String, dynamic> body, String field, {bool required = true, int max = 255}) {
    final value = body[field];
    if (value == null) {
      if (required) add(field, 'Le champ $field est obligatoire.');
      return null;
    }
    if (value is! String || (required && value.trim().isEmpty)) {
      add(field, 'Le champ $field est invalide.');
      return null;
    }
    if (value.length > max) {
      add(field, 'Le champ $field ne doit pas dépasser $max caractères.');
      return null;
    }
    return value.trim();
  }

  String? uuid(Map<String, dynamic> body, String field, {bool required = true}) {
    final value = body[field];
    if (value == null) {
      if (required) add(field, 'Le champ $field est obligatoire.');
      return null;
    }
    if (value is! String || !uuidPattern.hasMatch(value)) {
      add(field, 'Le champ $field doit être un UUID valide.');
      return null;
    }
    return value.toLowerCase();
  }

  String? password(Map<String, dynamic> body, {String field = 'password'}) {
    final value = string(body, field);
    if (value == null) return null;
    if (value.length < 8) {
      add(field, 'Le mot de passe doit contenir au moins 8 caractères.');
      return null;
    }
    if (body['password_confirmation'] != body[field]) {
      add(field, 'La confirmation du mot de passe ne correspond pas.');
      return null;
    }
    return value;
  }
}

final uuidPattern = RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$');

final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

final slugPattern = RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$');

Map<String, Object?> paginate(List<Object?> items, MockRequest request, String path) {
  final page = int.tryParse(request.query['page'] ?? '1') ?? 0;
  final perPage = int.tryParse(request.query['per_page'] ?? '20') ?? 0;
  if (page < 1) throw HttpError.field('page', 'La page doit être supérieure ou égale à 1.');
  if (perPage < 1 || perPage > 50) throw HttpError.field('per_page', 'Le nombre par page doit être compris entre 1 et 50.');
  final lastPage = items.isEmpty ? 1 : (items.length / perPage).ceil();
  final start = (page - 1) * perPage;
  final slice = start >= items.length ? const <Object?>[] : items.sublist(start, (start + perPage).clamp(0, items.length));
  String link(int p) => 'https://mock.herycia.local/api/v1$path?page=$p';
  return {
    'data': slice,
    'links': {
      'first': link(1),
      'last': link(lastPage),
      'prev': page > 1 ? link(page - 1) : null,
      'next': page < lastPage ? link(page + 1) : null,
    },
    'meta': {
      'current_page': page,
      'from': slice.isEmpty ? null : start + 1,
      'last_page': lastPage,
      'path': 'https://mock.herycia.local/api/v1$path',
      'per_page': perPage,
      'to': slice.isEmpty ? null : start + slice.length,
      'total': items.length,
    },
  };
}
