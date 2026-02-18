// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfflineProfile _$OfflineProfileFromJson(Map<String, dynamic> json) =>
    _OfflineProfile(
      id: json['id'] as String,
      createdByUserId: json['createdByUserId'] as String,
      name: json['name'] as String,
      dateOfBirth:
          const TimestampConverter().fromJson(json['dateOfBirth'] as Timestamp),
      timeOfBirth: _$JsonConverterFromJson<Map<String, dynamic>, TimeOfDay>(
          json['timeOfBirth'], const TimeOfDayConverter().fromJson),
      timeUnknown: json['timeUnknown'] as bool?,
      placeName: json['placeName'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$OfflineProfileToJson(_OfflineProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdByUserId': instance.createdByUserId,
      'name': instance.name,
      'dateOfBirth': const TimestampConverter().toJson(instance.dateOfBirth),
      'timeOfBirth': _$JsonConverterToJson<Map<String, dynamic>, TimeOfDay>(
          instance.timeOfBirth, const TimeOfDayConverter().toJson),
      'timeUnknown': instance.timeUnknown,
      'placeName': instance.placeName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
