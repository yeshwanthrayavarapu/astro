import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/blueprint/domain/journal_entry.dart';

class UserPattern {
  final String id;
  final String userId;
  final String patternTemplateId;
  final double intensity; // 0-100 score
  final bool isUnlocked; // false for premium patterns
  final DateTime? unlockedAt;
  final List<JournalEntry> journalEntries;

  const UserPattern({
    required this.id,
    required this.userId,
    required this.patternTemplateId,
    required this.intensity,
    required this.isUnlocked,
    this.unlockedAt,
    this.journalEntries = const [],
  });

  factory UserPattern.fromJson(Map<String, dynamic> json) {
    return UserPattern(
      id: json['id'] as String,
      userId: json['userId'] as String,
      patternTemplateId: json['patternTemplateId'] as String,
      intensity: (json['intensity'] as num).toDouble(),
      isUnlocked: json['isUnlocked'] as bool,
      unlockedAt: json['unlockedAt'] != null
          ? (json['unlockedAt'] as Timestamp).toDate()
          : null,
      journalEntries: (json['journalEntries'] as List<dynamic>?)
              ?.map((e) => JournalEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'patternTemplateId': patternTemplateId,
      'intensity': intensity,
      'isUnlocked': isUnlocked,
      'unlockedAt': unlockedAt != null ? Timestamp.fromDate(unlockedAt!) : null,
      'journalEntries': journalEntries.map((e) => e.toJson()).toList(),
    };
  }

  UserPattern copyWith({
    String? id,
    String? userId,
    String? patternTemplateId,
    double? intensity,
    bool? isUnlocked,
    DateTime? unlockedAt,
    List<JournalEntry>? journalEntries,
  }) {
    return UserPattern(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      patternTemplateId: patternTemplateId ?? this.patternTemplateId,
      intensity: intensity ?? this.intensity,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      journalEntries: journalEntries ?? this.journalEntries,
    );
  }
}
