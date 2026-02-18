// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentCollection _$ContentCollectionFromJson(Map<String, dynamic> json) =>
    _ContentCollection(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String,
      isPremium: json['isPremium'] as bool,
      sortOrder: (json['sortOrder'] as num).toInt(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$ContentCollectionToJson(_ContentCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'isPremium': instance.isPremium,
      'sortOrder': instance.sortOrder,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
