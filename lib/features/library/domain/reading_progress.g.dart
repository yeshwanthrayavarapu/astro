// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadingProgress _$ReadingProgressFromJson(Map<String, dynamic> json) =>
    _ReadingProgress(
      userId: json['userId'] as String,
      contentItemId: json['contentItemId'] as String,
      progressPercent: (json['progressPercent'] as num).toDouble(),
      lastReadAt:
          const TimestampConverter().fromJson(json['lastReadAt'] as Timestamp),
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$ReadingProgressToJson(_ReadingProgress instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'contentItemId': instance.contentItemId,
      'progressPercent': instance.progressPercent,
      'lastReadAt': const TimestampConverter().toJson(instance.lastReadAt),
      'completed': instance.completed,
    };
