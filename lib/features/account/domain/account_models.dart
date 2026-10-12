import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';

part 'account_models.freezed.dart';
part 'account_models.g.dart';

enum UserRole {
  @JsonValue('user')
  user,
  @JsonValue('content_admin')
  contentAdmin,
  @JsonValue('super_admin')
  superAdmin,
  @JsonValue('stylist')
  stylist,
  @JsonValue('vendor')
  vendor,
}

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @IdConverter() required String id,
    required String name,
    String? email,
    @Default([UserRole.user]) List<UserRole> roles,
    @NullableUtcDateTimeConverter() DateTime? emailVerifiedAt,
    @UtcDateTimeConverter() required DateTime createdAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}

@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String token,
    @Default('Bearer') String tokenType,
    @UtcDateTimeConverter() required DateTime expiresAt,
    required AppUser user,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) => _$AuthSessionFromJson(json);
}

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required bool acceptsPrivacyPolicy,
    @Default('mobile') String deviceName,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
    @Default('mobile') String deviceName,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

@freezed
abstract class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) = _ResetPasswordRequest;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);
}

enum ThemePreference {
  @JsonValue('system')
  system,
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark,
}

@freezed
abstract class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default('fr') String language,
    @Default([]) List<String> styleSlugs,
    @Default([]) List<String> occasionSlugs,
    @Default(ThemePreference.system) ThemePreference theme,
    @Default('straight') String silhouette,
    @NullableUtcDateTimeConverter() DateTime? updatedAt,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);
}
