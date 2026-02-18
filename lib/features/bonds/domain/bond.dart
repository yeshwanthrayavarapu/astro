import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'bond.freezed.dart';
part 'bond.g.dart';

@freezed
abstract class Bond with _$Bond {
  const factory Bond({
    required String id,
    required String userId, // primary user
    required String otherProfileId, // can be another user or offline profile
    required String otherName,
    DateTime? otherDateOfBirth, // if offline profile
    required BondScores scores,
    required List<String>
        labels, // e.g., ['intense', 'challenging', 'transformative']
    required String summary,
    required BondDynamics dynamics,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _Bond;

  factory Bond.fromJson(Map<String, dynamic> json) => _$BondFromJson(json);
}

@freezed
abstract class BondScores with _$BondScores {
  const factory BondScores({
    required int emotional, // 0-100
    required int intellectual, // 0-100
    required int communication, // 0-100
    required int values, // 0-100
    required int longTerm, // 0-100
    required int overall, // average
  }) = _BondScores;

  factory BondScores.fromJson(Map<String, dynamic> json) =>
      _$BondScoresFromJson(json);
}

@freezed
abstract class BondDynamics with _$BondDynamics {
  const factory BondDynamics({
    required String strengths,
    required String challenges,
    required String advice,
    required List<String> tips,
  }) = _BondDynamics;

  factory BondDynamics.fromJson(Map<String, dynamic> json) =>
      _$BondDynamicsFromJson(json);
}

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
