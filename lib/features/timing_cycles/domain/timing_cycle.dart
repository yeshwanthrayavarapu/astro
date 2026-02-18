import 'package:cloud_firestore/cloud_firestore.dart';

class TimingCycle {
  final String id;
  final String userId;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String
      theme; // 'relationships', 'career', 'personal_growth', 'health', 'creativity'
  final int priority; // 1-10
  final List<String> suggestions;
  final String? affirmation;
  final int? notificationId;

  const TimingCycle({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.theme,
    required this.priority,
    required this.suggestions,
    this.affirmation,
    this.notificationId,
  });

  factory TimingCycle.fromJson(Map<String, dynamic> json) {
    return TimingCycle(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: (json['startDate'] as Timestamp).toDate(),
      endDate: (json['endDate'] as Timestamp).toDate(),
      theme: json['theme'] as String,
      priority: json['priority'] as int,
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      affirmation: json['affirmation'] as String?,
      notificationId: json['notificationId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'theme': theme,
      'priority': priority,
      'suggestions': suggestions,
      'affirmation': affirmation,
      'notificationId': notificationId,
    };
  }

  TimingCycle copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? theme,
    int? priority,
    List<String>? suggestions,
    String? affirmation,
    int? notificationId,
  }) {
    return TimingCycle(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      theme: theme ?? this.theme,
      priority: priority ?? this.priority,
      suggestions: suggestions ?? this.suggestions,
      affirmation: affirmation ?? this.affirmation,
      notificationId: notificationId ?? this.notificationId,
    );
  }
}
