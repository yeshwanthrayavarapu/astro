import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/bonds/domain/bond.dart'; // For TimestampConverter

part 'content_collection.freezed.dart';
part 'content_collection.g.dart';

@freezed
abstract class ContentCollection with _$ContentCollection {
  const factory ContentCollection({
    required String id,
    required String title,
    required String description,
    String? imageUrl,
    required String category, // 'patterns', 'timing', 'relationships', 'growth'
    required bool isPremium,
    required int sortOrder,
    @TimestampConverter() required DateTime createdAt,
  }) = _ContentCollection;

  factory ContentCollection.fromJson(Map<String, dynamic> json) =>
      _$ContentCollectionFromJson(json);
}
