import 'package:cloud_firestore/cloud_firestore.dart';

class JournalEntry {
  final String id;
  final String content;
  final DateTime createdAt;

  const JournalEntry({
    required this.id,
    required this.content,
    required this.createdAt,
  });

  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    return JournalEntry(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
