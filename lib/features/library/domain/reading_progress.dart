import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/bonds/domain/bond.dart'; // For TimestampConverter

part 'reading_progress.freezed.dart';
part 'reading_progress.g.dart';

@freezed
abstract class ReadingProgress with _$ReadingProgress {
  const factory ReadingProgress({
    required String userId,
    required String contentItemId,
    required double progressPercent, // 0-1.0
    @TimestampConverter() required DateTime lastReadAt,
    bool? completed,
  }) = _ReadingProgress;

  factory ReadingProgress.fromJson(Map<String, dynamic> json) =>
      _$ReadingProgressFromJson(json);
}
