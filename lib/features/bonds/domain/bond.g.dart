// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bond _$BondFromJson(Map<String, dynamic> json) => _Bond(
      id: json['id'] as String,
      userId: json['userId'] as String,
      otherProfileId: json['otherProfileId'] as String,
      otherName: json['otherName'] as String,
      otherDateOfBirth: json['otherDateOfBirth'] == null
          ? null
          : DateTime.parse(json['otherDateOfBirth'] as String),
      scores: BondScores.fromJson(json['scores'] as Map<String, dynamic>),
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      summary: json['summary'] as String,
      dynamics: BondDynamics.fromJson(json['dynamics'] as Map<String, dynamic>),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['updatedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$BondToJson(_Bond instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'otherProfileId': instance.otherProfileId,
      'otherName': instance.otherName,
      'otherDateOfBirth': instance.otherDateOfBirth?.toIso8601String(),
      'scores': instance.scores,
      'labels': instance.labels,
      'summary': instance.summary,
      'dynamics': instance.dynamics,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedAt, const TimestampConverter().toJson),
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

_BondScores _$BondScoresFromJson(Map<String, dynamic> json) => _BondScores(
      emotional: (json['emotional'] as num).toInt(),
      intellectual: (json['intellectual'] as num).toInt(),
      communication: (json['communication'] as num).toInt(),
      values: (json['values'] as num).toInt(),
      longTerm: (json['longTerm'] as num).toInt(),
      overall: (json['overall'] as num).toInt(),
    );

Map<String, dynamic> _$BondScoresToJson(_BondScores instance) =>
    <String, dynamic>{
      'emotional': instance.emotional,
      'intellectual': instance.intellectual,
      'communication': instance.communication,
      'values': instance.values,
      'longTerm': instance.longTerm,
      'overall': instance.overall,
    };

_BondDynamics _$BondDynamicsFromJson(Map<String, dynamic> json) =>
    _BondDynamics(
      strengths: json['strengths'] as String,
      challenges: json['challenges'] as String,
      advice: json['advice'] as String,
      tips: (json['tips'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BondDynamicsToJson(_BondDynamics instance) =>
    <String, dynamic>{
      'strengths': instance.strengths,
      'challenges': instance.challenges,
      'advice': instance.advice,
      'tips': instance.tips,
    };
