import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/blueprint/data/seed_patterns.dart';
import 'package:life_pattern/features/blueprint/domain/journal_entry.dart';
import 'package:life_pattern/features/blueprint/domain/pattern_template.dart';
import 'package:life_pattern/features/blueprint/domain/user_pattern.dart';
import 'package:uuid/uuid.dart';

class BlueprintRepository {
  BlueprintRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final _uuid = const Uuid();

  // ---------------------------------------------------------------------------
  // Templates
  // ---------------------------------------------------------------------------

  /// Fetches all pattern templates.
  /// For now, returns local seed data to save reads, but simulates async.
  Future<List<PatternTemplate>> getPatternTemplates() async {
    // In a real app, we might fetch from Firestore:
    // final snapshot = await _firestore.collection('pattern_templates').get();
    // return snapshot.docs.map((d) => PatternTemplate.fromJson(d.data())).toList();

    // Returning local constants for MVP:
    return getSeedPatterns();
  }

  /// Helper to find a specific template by ID from the local seed list.
  PatternTemplate? getTemplate(String id) {
    try {
      return getSeedPatterns().firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
  }

  // ---------------------------------------------------------------------------
  // User Patterns
  // ---------------------------------------------------------------------------

  /// Stream of the user's assigned patterns.
  Stream<List<UserPattern>> watchUserPatterns(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('patterns')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserPattern.fromJson(doc.data()))
            .toList());
  }

  /// Assigns initial patterns to a user if they don't have any.
  Future<void> assignInitialPatternsIfNeeded(String userId) async {
    final userPatternsRef =
        _firestore.collection('users').doc(userId).collection('patterns');

    final snapshot = await userPatternsRef.limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      return; // Already has patterns
    }

    // Assign patterns!
    final allTemplates = getSeedPatterns();
    final random = Random();
    final batch = _firestore.batch();

    // Group by category
    final core = allTemplates.where((t) => t.category == 'core_self').toList();
    final growth = allTemplates.where((t) => t.category == 'growth').toList();
    final relationships =
        allTemplates.where((t) => t.category == 'relationships').toList();

    // Pick 3 from each
    final selected = [
      ..._pickRandom(core, 3, random),
      ..._pickRandom(growth, 3, random),
      ..._pickRandom(relationships, 3, random),
    ];

    for (final template in selected) {
      final docRef = userPatternsRef.doc(); // Auto-ID
      final isUnlocked = random.nextDouble() < 0.7; // 70% chance to be free
      final intensity = 60 + random.nextInt(36); // 60-95

      final pattern = UserPattern(
        id: docRef.id,
        userId: userId,
        patternTemplateId: template.id,
        intensity: intensity.toDouble(),
        isUnlocked: isUnlocked,
        unlockedAt: isUnlocked ? DateTime.now() : null,
        journalEntries: [],
      );

      batch.set(docRef, pattern.toJson());
    }

    await batch.commit();
  }

  List<PatternTemplate> _pickRandom(
    List<PatternTemplate> list,
    int count,
    Random random,
  ) {
    final copy = List<PatternTemplate>.from(list);
    copy.shuffle(random);
    return copy.take(count).toList();
  }

  // ---------------------------------------------------------------------------
  // Journaling
  // ---------------------------------------------------------------------------

  Future<void> addJournalEntry({
    required String userId,
    required String patternId,
    required String content,
  }) async {
    final docRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('patterns')
        .doc(patternId);

    final entry = JournalEntry(
      id: _uuid.v4(),
      content: content,
      createdAt: DateTime.now(),
    );

    // Using arrayUnion to add to the list
    await docRef.update({
      'journalEntries': FieldValue.arrayUnion([entry.toJson()]),
    });
  }
}
