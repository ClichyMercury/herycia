import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';

part 'account_models.freezed.dart';
part 'account_models.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @IdConverter() required String id,
    required String name,
    String? email,
    @NullableUtcDateTimeConverter() DateTime? emailVerifiedAt,
    @UtcDateTimeConverter() required DateTime createdAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}

@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String accessToken,
    @Default('Bearer') String tokenType,
    @Default(900) int expiresIn,
    AppUser? user,
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
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

@freezed
abstract class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({
    required String email,
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) = _ResetPasswordRequest;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);
}

@freezed
abstract class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) = _ChangePasswordRequest;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);
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
abstract class RemotePreferences with _$RemotePreferences {
  const factory RemotePreferences({
    @Default('fr') String language,
    @IdListConverter() @Default([]) List<String> styleIds,
    @IdListConverter() @Default([]) List<String> occasionIds,
    @NullableUtcDateTimeConverter() DateTime? updatedAt,
  }) = _RemotePreferences;

  factory RemotePreferences.fromJson(Map<String, dynamic> json) => _$RemotePreferencesFromJson(json);
}

@freezed
abstract class UserPreferences with _$UserPreferences {
  const UserPreferences._();

  const factory UserPreferences({
    @Default('fr') String language,
    @Default([]) List<String> styleIds,
    @Default([]) List<String> occasionIds,
    @Default(ThemePreference.system) ThemePreference theme,
    @Default('straight') String silhouette,
    @NullableUtcDateTimeConverter() DateTime? updatedAt,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);

  RemotePreferences toRemote() =>
      RemotePreferences(language: language, styleIds: styleIds, occasionIds: occasionIds);

  UserPreferences withRemote(RemotePreferences remote) =>
      copyWith(language: remote.language, styleIds: remote.styleIds, occasionIds: remote.occasionIds);
}
