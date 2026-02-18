// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentItem _$ContentItemFromJson(Map<String, dynamic> json) => _ContentItem(
      id: json['id'] as String,
      collectionId: json['collectionId'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      contentMarkdown: json['contentMarkdown'] as String,
      readTimeMinutes: (json['readTimeMinutes'] as num).toInt(),
      isPremium: json['isPremium'] as bool,
      sortOrder: (json['sortOrder'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String?,
      publishedAt:
          const TimestampConverter().fromJson(json['publishedAt'] as Timestamp),
    );

Map<String, dynamic> _$ContentItemToJson(_ContentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectionId': instance.collectionId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'contentMarkdown': instance.contentMarkdown,
      'readTimeMinutes': instance.readTimeMinutes,
      'isPremium': instance.isPremium,
      'sortOrder': instance.sortOrder,
      'tags': instance.tags,
      'imageUrl': instance.imageUrl,
      'publishedAt': const TimestampConverter().toJson(instance.publishedAt),
    };
