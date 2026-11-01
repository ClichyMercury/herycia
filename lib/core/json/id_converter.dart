import 'package:json_annotation/json_annotation.dart';

class IdConverter implements JsonConverter<String, Object> {
  const IdConverter();

  @override
  String fromJson(Object json) => switch (json) {
        String value when value.isNotEmpty => value,
        int value => value.toString(),
        _ => throw FormatException('Identifiant invalide : $json'),
      };

  @override
  Object toJson(String id) => id;
}

class NullableIdConverter implements JsonConverter<String?, Object?> {
  const NullableIdConverter();

  @override
  String? fromJson(Object? json) => json == null ? null : const IdConverter().fromJson(json);

  @override
  Object? toJson(String? id) => id;
}

class IdListConverter implements JsonConverter<List<String>, List<dynamic>> {
  const IdListConverter();

  @override
  List<String> fromJson(List<dynamic> json) =>
      [for (final id in json) const IdConverter().fromJson(id as Object)];

  @override
  List<dynamic> toJson(List<String> ids) => ids;
}

class UtcDateTimeConverter implements JsonConverter<DateTime, String> {
  const UtcDateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toUtc();

  @override
  String toJson(DateTime date) => date.toUtc().toIso8601String();
}

class NullableUtcDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const NullableUtcDateTimeConverter();

  @override
  DateTime? fromJson(String? json) => json == null ? null : DateTime.parse(json).toUtc();

  @override
  String? toJson(DateTime? date) => date?.toUtc().toIso8601String();
}
