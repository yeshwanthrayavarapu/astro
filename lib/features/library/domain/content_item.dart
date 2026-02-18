import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/bonds/domain/bond.dart'; // For TimestampConverter

part 'content_item.freezed.dart';
part 'content_item.g.dart';

@freezed
abstract class ContentItem with _$ContentItem {
  const factory ContentItem({
    required String id,
    required String collectionId,
    required String title,
    required String subtitle,
    required String contentMarkdown,
    required int readTimeMinutes,
    required bool isPremium,
    required int sortOrder,
    List<String>? tags,
    String? imageUrl,
    @TimestampConverter() required DateTime publishedAt,
  }) = _ContentItem;

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);
}
