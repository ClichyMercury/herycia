part of '../mock_backend.dart';

extension _AuthRoutes on MockBackend {
  List<MockRoute> get _authRoutes => [
        MockRoute('POST', '/auth/register', _register),
        MockRoute('POST', '/auth/login', _login),
        MockRoute('POST', '/auth/refresh', _refresh),
        MockRoute('POST', '/auth/logout', (request, _) {
          final token = tokens[request.bearerToken];
          if (token == null) throw HttpError.unauthenticated();
          token.revoked = true;
          return const MockResponse.noContent();
        }),
        MockRoute('POST', '/auth/password/forgot', _forgot),
        MockRoute('POST', '/auth/password/reset', _reset),
        MockRoute('GET', '/me', (request, _) => MockResponse.ok({'data': requireUser(request).toJson()})),
        MockRoute('PATCH', '/me', (request, _) {
          final user = requireUser(request);
          final v = Validator();
          final name = v.string(request.bodyMap, 'name', required: false, max: 100);
          v.throwIfInvalid();
          if (name != null) user.name = name;
          return MockResponse.ok({'data': user.toJson()});
        }),
        MockRoute('PUT', '/me/password', _changePassword),
        MockRoute('DELETE', '/me', (request, _) {
          final user = requireUser(request);
          if (request.bodyMap['password'] != user.passwordForMockOnly) {
            throw HttpError.field('password', 'Le mot de passe est incorrect.');
          }
          users.remove(user.email);
          favorites.remove(user.id);
          savedOutfits.remove(user.id);
          preferences.remove(user.id);
          revokeAllTokens(user);
          return const MockResponse.noContent();
        }),
      ];

  MockResponse _register(MockRequest request, Map<String, String> _) {
    final body = request.bodyMap;
    final v = Validator();
    final name = v.string(body, 'name', max: 100);
    final email = v.string(body, 'email')?.toLowerCase();
    final password = v.password(body);
    if (email != null && !emailPattern.hasMatch(email)) v.add('email', "L'adresse e-mail est invalide.");
    if (email != null && users.containsKey(email)) v.add('email', 'Cette adresse e-mail est déjà utilisée.');
    v.throwIfInvalid();
    final user = MockUser(
      id: nextUuid(),
      name: name!,
      email: email!,
      passwordForMockOnly: password!,
      createdAt: clock(),
    );
    users[email] = user;
    return MockResponse.created(authPayload(user, issueToken(user.id)));
  }

  MockResponse _login(MockRequest request, Map<String, String> _) {
    final body = request.bodyMap;
    final v = Validator();
    final email = v.string(body, 'email')?.toLowerCase();
    final password = v.string(body, 'password');
    v.throwIfInvalid();
    final user = users[email];
    if (user == null || user.passwordForMockOnly != password) throw HttpError.unauthenticated('Identifiants invalides.');
    return MockResponse.ok(authPayload(user, issueToken(user.id)));
  }

  MockResponse _refresh(MockRequest request, Map<String, String> _) {
    final token = tokens[request.bearerToken];
    if (token == null || token.revoked) throw HttpError.unauthenticated();
    final user = _userOf(token);
    if (user == null || token.issuedAt.isBefore(user.tokenValidAfter)) throw HttpError.unauthenticated();
    if (clock().isAfter(token.loginAt.add(MockBackend.refreshWindow))) throw HttpError.unauthenticated();
    token.revoked = true;
    return MockResponse.ok(authPayload(user, issueToken(user.id, loginAt: token.loginAt), withUser: false));
  }

  MockResponse _forgot(MockRequest request, Map<String, String> _) {
    final v = Validator();
    final email = v.string(request.bodyMap, 'email')?.toLowerCase();
    v.throwIfInvalid();
    if (users.containsKey(email)) otps[email!] = (otp: MockBackend.mockOtp, attempts: 0);
    return const MockResponse(202, {
      'data': {'message': 'Si un compte existe pour cette adresse, un code de réinitialisation vient d’être envoyé.'},
    });
  }

  MockResponse _reset(MockRequest request, Map<String, String> _) {
    final body = request.bodyMap;
    final v = Validator();
    final email = v.string(body, 'email')?.toLowerCase();
    final otp = v.string(body, 'otp');
    final password = v.password(body);
    if (otp != null && !RegExp(r'^\d{6}$').hasMatch(otp)) v.add('otp', 'Le code doit contenir 6 chiffres.');
    v.throwIfInvalid();
    final pending = otps[email];
    final user = users[email];
    if (pending == null || user == null || pending.otp != otp || pending.attempts >= 5) {
      if (pending != null) otps[email!] = (otp: pending.otp, attempts: pending.attempts + 1);
      throw HttpError.field('otp', 'Ce code est invalide ou a expiré.');
    }
    otps.remove(email);
    user.passwordForMockOnly = password!;
    revokeAllTokens(user);
    return const MockResponse.ok({
      'data': {'message': 'Votre mot de passe a été réinitialisé.'},
    });
  }

  MockResponse _changePassword(MockRequest request, Map<String, String> _) {
    final user = requireUser(request);
    final body = request.bodyMap;
    final v = Validator();
    final current = v.string(body, 'current_password');
    final password = v.password(body);
    if (current != null && current != user.passwordForMockOnly) {
      v.add('current_password', 'Le mot de passe actuel est incorrect.');
    }
    v.throwIfInvalid();
    user.passwordForMockOnly = password!;
    revokeAllTokens(user);
    final token = issueToken(user.id);
    tokens[token] = MockToken(userId: user.id, issuedAt: user.tokenValidAfter, loginAt: user.tokenValidAfter);
    return MockResponse.ok(authPayload(user, token, withUser: false));
  }
}
