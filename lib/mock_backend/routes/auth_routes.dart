part of '../mock_backend.dart';

extension _AuthRoutes on MockBackend {
  static const minPasswordLength = 8;

  MockUser? _userByEmail(String email) {
    final normalized = email.trim().toLowerCase();
    for (final u in users.values) {
      if (u.email == normalized) return u;
    }
    return null;
  }

  void _validatePassword(Validator v, Map<String, dynamic> body) {
    final password = body['password'];
    if (password is! String || password.length < minPasswordLength) {
      v.add('password', 'Le mot de passe doit contenir au moins $minPasswordLength caractères.');
    } else if (body['password_confirmation'] != password) {
      v.add('password_confirmation', 'Les deux mots de passe ne correspondent pas.');
    }
  }

  List<MockRoute> get _authRoutes => [
        MockRoute('POST', '/auth/register', (r, p) {
          final body = r.bodyMap;
          final v = Validator();
          final name = v.requiredString(body, 'name', 'nom ou pseudonyme', max: 60);
          final email = v.requiredString(body, 'email', 'adresse e-mail');
          if (email != null && !emailPattern.hasMatch(email)) {
            v.add('email', 'Entrez une adresse e-mail valide.');
          } else if (email != null && _userByEmail(email) != null) {
            v.add('email', 'Un compte existe déjà avec cette adresse.');
          }
          _validatePassword(v, body);
          if (body['accepts_privacy_policy'] != true) {
            v.add('accepts_privacy_policy', 'Vous devez accepter la politique de confidentialité.');
          }
          v.throwIfInvalid();
          final user = MockUser(
            id: nextId('user'),
            name: name!,
            email: email!.toLowerCase(),
            passwordForMockOnly: body['password'] as String,
            createdAt: clock(),
          );
          users[user.id] = user;
          return MockResponse.created({'data': issueToken(user).toJson()});
        }),
        MockRoute('POST', '/auth/login', (r, p) {
          final body = r.bodyMap;
          final v = Validator();
          final email = v.requiredString(body, 'email', 'adresse e-mail');
          final password = v.requiredString(body, 'password', 'mot de passe');
          v.throwIfInvalid();
          final key = email!.toLowerCase();
          final now = clock();
          final recent = (failedLogins[key] ?? [])
              .where((t) => now.difference(t) < const Duration(minutes: 1))
              .toList();
          if (recent.length >= MockBackend.maxLoginAttemptsPerMinute) {
            throw const HttpError(
              429,
              ApiErrorCode.rateLimited,
              'Trop de tentatives. Réessayez dans une minute.',
              {},
              {'retry_after': 60},
            );
          }
          final user = _userByEmail(key);
          if (user == null || user.passwordForMockOnly != password) {
            failedLogins[key] = [...recent, now];
            throw HttpError.validation({
              'email': ['Ces identifiants ne correspondent à aucun compte.'],
            });
          }
          failedLogins.remove(key);
          return MockResponse.ok({'data': issueToken(user).toJson()});
        }),
        MockRoute('POST', '/auth/logout', (r, p) {
          requireUser(r);
          tokens.remove(r.bearerToken);
          return const MockResponse.noContent();
        }),
        MockRoute('POST', '/auth/forgot-password', (r, p) {
          final v = Validator();
          final email = v.requiredString(r.bodyMap, 'email', 'adresse e-mail');
          if (email != null && !emailPattern.hasMatch(email)) v.add('email', 'Entrez une adresse e-mail valide.');
          v.throwIfInvalid();
          final user = _userByEmail(email!);
          if (user != null) resetTokens[user.email] = 'reset_${nextId('reset').padLeft(4, '0')}';
          return const MockResponse.ok({
            'message': 'Si un compte existe pour cette adresse, un e-mail de réinitialisation a été envoyé.',
          });
        }),
        MockRoute('POST', '/auth/reset-password', (r, p) {
          final body = r.bodyMap;
          final v = Validator();
          final email = v.requiredString(body, 'email', 'adresse e-mail');
          final token = v.requiredString(body, 'token', 'jeton');
          _validatePassword(v, body);
          v.throwIfInvalid();
          final user = _userByEmail(email!);
          if (user == null || resetTokens[user.email] != token) {
            throw HttpError.validation({
              'token': ['Ce lien de réinitialisation est invalide ou a expiré.'],
            });
          }
          user.passwordForMockOnly = body['password'] as String;
          resetTokens.remove(user.email);
          tokens.removeWhere((_, entry) => entry.userId == user.id);
          return const MockResponse.ok({'message': 'Votre mot de passe a été modifié.'});
        }),
        MockRoute('GET', '/me', (r, p) {
          return MockResponse.ok({'data': requireUser(r).toModel().toJson()});
        }),
        MockRoute('DELETE', '/me', (r, p) {
          final user = requireUser(r);
          users.remove(user.id);
          tokens.removeWhere((_, entry) => entry.userId == user.id);
          favorites.remove(user.id);
          savedOutfits.remove(user.id);
          preferences.remove(user.id);
          for (final f in feedback) {
            if (f.userId == user.id) f.userId = null;
          }
          return const MockResponse.noContent();
        }),
      ];
}
