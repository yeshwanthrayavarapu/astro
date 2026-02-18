import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart'; // For TimeOfDay
import 'package:cloud_firestore/cloud_firestore.dart';

part 'offline_profile.freezed.dart';
part 'offline_profile.g.dart';

// Custom converter for TimeOfDay
class TimeOfDayConverter
    implements JsonConverter<TimeOfDay, Map<String, dynamic>> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(Map<String, dynamic> json) {
    return TimeOfDay(hour: json['hour'] as int, minute: json['minute'] as int);
  }

  @override
  Map<String, dynamic> toJson(TimeOfDay time) {
    return {'hour': time.hour, 'minute': time.minute};
  }
}

// Reuse TimestampConverter from bond.dart or define here
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}

@freezed
abstract class OfflineProfile with _$OfflineProfile {
  const factory OfflineProfile({
    required String id,
    required String createdByUserId,
    required String name,
    @TimestampConverter() required DateTime dateOfBirth,
    @TimeOfDayConverter() TimeOfDay? timeOfBirth,
    bool? timeUnknown,
    String? placeName,
    double? latitude,
    double? longitude,
    String? timezone,
    @TimestampConverter() required DateTime createdAt,
  }) = _OfflineProfile;

  factory OfflineProfile.fromJson(Map<String, dynamic> json) =>
      _$OfflineProfileFromJson(json);
}
