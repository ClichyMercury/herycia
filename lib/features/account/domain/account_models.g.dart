// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: const IdConverter().fromJson(json['id'] as Object),
  name: json['name'] as String,
  email: json['email'] as String?,
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$UserRoleEnumMap, e))
          .toList() ??
      const [UserRole.user],
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
  'roles': instance.roles.map((e) => _$UserRoleEnumMap[e]!).toList(),
  'email_verified_at': const NullableUtcDateTimeConverter().toJson(
    instance.emailVerifiedAt,
  ),
  'created_at': const UtcDateTimeConverter().toJson(instance.createdAt),
};

const _$UserRoleEnumMap = {
  UserRole.user: 'user',
  UserRole.contentAdmin: 'content_admin',
  UserRole.superAdmin: 'super_admin',
  UserRole.stylist: 'stylist',
  UserRole.vendor: 'vendor',
};

_AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => _AuthSession(
  token: json['token'] as String,
  tokenType: json['token_type'] as String? ?? 'Bearer',
  expiresAt: const UtcDateTimeConverter().fromJson(
    json['expires_at'] as String,
  ),
  user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthSessionToJson(_AuthSession instance) =>
    <String, dynamic>{
      'token': instance.token,
      'token_type': instance.tokenType,
      'expires_at': const UtcDateTimeConverter().toJson(instance.expiresAt),
      'user': instance.user.toJson(),
    };

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      acceptsPrivacyPolicy: json['accepts_privacy_policy'] as bool,
      deviceName: json['device_name'] as String? ?? 'mobile',
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'accepts_privacy_policy': instance.acceptsPrivacyPolicy,
      'device_name': instance.deviceName,
    };

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      deviceName: json['device_name'] as String? ?? 'mobile',
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'device_name': instance.deviceName,
    };

_ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordRequest(
  email: json['email'] as String,
  token: json['token'] as String,
  password: json['password'] as String,
  passwordConfirmation: json['password_confirmation'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  _ResetPasswordRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'token': instance.token,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
};

_UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    _UserPreferences(
      language: json['language'] as String? ?? 'fr',
      styleSlugs:
          (json['style_slugs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      occasionSlugs:
          (json['occasion_slugs'] as List<dynamic>?)
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
  'style_slugs': instance.styleSlugs,
  'occasion_slugs': instance.occasionSlugs,
  'theme': _$ThemePreferenceEnumMap[instance.theme]!,
  'silhouette': instance.silhouette,
  'updated_at': const NullableUtcDateTimeConverter().toJson(instance.updatedAt),
};

const _$ThemePreferenceEnumMap = {
  ThemePreference.system: 'system',
  ThemePreference.light: 'light',
  ThemePreference.dark: 'dark',
};
