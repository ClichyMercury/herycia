// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: const IdConverter().fromJson(json['id'] as Object),
  name: json['name'] as String,
  email: json['email'] as String?,
  emailVerifiedAt: const NullableUtcDateTimeConverter().fromJson(
    json['email_verified_at'] as String?,
  ),
  createdAt: const UtcDateTimeConverter().fromJson(
    json['created_at'] as String,
  ),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': const IdConverter().toJson(instance.id),
  'name': instance.name,
  'email': instance.email,
  'email_verified_at': const NullableUtcDateTimeConverter().toJson(
    instance.emailVerifiedAt,
  ),
  'created_at': const UtcDateTimeConverter().toJson(instance.createdAt),
};

_AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => _AuthSession(
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String? ?? 'Bearer',
  expiresIn: (json['expires_in'] as num?)?.toInt() ?? 900,
  user: json['user'] == null
      ? null
      : AppUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthSessionToJson(_AuthSession instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'user': instance.user?.toJson(),
    };

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordRequest(
  email: json['email'] as String,
  otp: json['otp'] as String,
  password: json['password'] as String,
  passwordConfirmation: json['password_confirmation'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  _ResetPasswordRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'otp': instance.otp,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
};

_ChangePasswordRequest _$ChangePasswordRequestFromJson(
  Map<String, dynamic> json,
) => _ChangePasswordRequest(
  currentPassword: json['current_password'] as String,
  password: json['password'] as String,
  passwordConfirmation: json['password_confirmation'] as String,
);

Map<String, dynamic> _$ChangePasswordRequestToJson(
  _ChangePasswordRequest instance,
) => <String, dynamic>{
  'current_password': instance.currentPassword,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
};

_RemotePreferences _$RemotePreferencesFromJson(Map<String, dynamic> json) =>
    _RemotePreferences(
      language: json['language'] as String? ?? 'fr',
      styleIds: json['style_ids'] == null
          ? const []
          : const IdListConverter().fromJson(json['style_ids'] as List),
      occasionIds: json['occasion_ids'] == null
          ? const []
          : const IdListConverter().fromJson(json['occasion_ids'] as List),
      updatedAt: const NullableUtcDateTimeConverter().fromJson(
        json['updated_at'] as String?,
      ),
    );

Map<String, dynamic> _$RemotePreferencesToJson(
  _RemotePreferences instance,
) => <String, dynamic>{
  'language': instance.language,
  'style_ids': const IdListConverter().toJson(instance.styleIds),
  'occasion_ids': const IdListConverter().toJson(instance.occasionIds),
  'updated_at': const NullableUtcDateTimeConverter().toJson(instance.updatedAt),
};

_UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    _UserPreferences(
      language: json['language'] as String? ?? 'fr',
      styleIds:
          (json['style_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      occasionIds:
          (json['occasion_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      theme:
          $enumDecodeNullable(_$ThemePreferenceEnumMap, json['theme']) ??
          ThemePreference.system,
      silhouette: json['silhouette'] as String? ?? 'straight',
      updatedAt: const NullableUtcDateTimeConverter().fromJson(
        json['updated_at'] as String?,
      ),
    );

Map<String, dynamic> _$UserPreferencesToJson(
  _UserPreferences instance,
) => <String, dynamic>{
  'language': instance.language,
  'style_ids': instance.styleIds,
  'occasion_ids': instance.occasionIds,
  'theme': _$ThemePreferenceEnumMap[instance.theme]!,
  'silhouette': instance.silhouette,
  'updated_at': const NullableUtcDateTimeConverter().toJson(instance.updatedAt),
};

const _$ThemePreferenceEnumMap = {
  ThemePreference.system: 'system',
  ThemePreference.light: 'light',
  ThemePreference.dark: 'dark',
};
