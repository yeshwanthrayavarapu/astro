import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/timing_cycles/domain/timing_cycle.dart';
import 'package:uuid/uuid.dart';

class TimingRepository {
  final FirebaseFirestore _firestore;

  TimingRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  /// Stream cycles for a user
  Stream<List<TimingCycle>> watchCycles(String userId) {
    return _firestore
        .collection('timing_cycles')
        .doc(userId)
        .collection('cycles')
        .orderBy('startDate')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => TimingCycle.fromJson(doc.data()))
          .toList();
    });
  }

  /// Generate cycles if user collection is empty (Deterministic Placeholder)
  Future<void> generateCyclesIfEmpty(String userId, DateTime birthDate) async {
    final cyclesQuery = await _firestore
        .collection('timing_cycles')
        .doc(userId)
        .collection('cycles')
        .limit(1)
        .get();

    if (cyclesQuery.docs.isNotEmpty) return;

    // Generate 12 cycles for the next 12 months
    final batch = _firestore.batch();
    final now = DateTime.now();
    final random =
        Random(birthDate.millisecondsSinceEpoch); // Deterministic seed

    DateTime currentStart =
        now.subtract(const Duration(days: 5)); // Start slightly in past

    final themes = [
      'relationships',
      'career',
      'personal_growth',
      'health',
      'creativity'
    ];

    for (int i = 0; i < 12; i++) {
      final durationDays = 14 + random.nextInt(45); // 2-8 weeks
      final endDate = currentStart.add(Duration(days: durationDays));
      final theme = themes[random.nextInt(themes.length)];
      final id = const Uuid().v4();

      final cycle = TimingCycle(
        id: id,
        userId: userId,
        title: _getTitleForTheme(theme, random),
        description: _getDescriptionForTheme(theme),
        startDate: currentStart,
        endDate: endDate,
        theme: theme,
        priority: 1 + random.nextInt(10),
        suggestions: _getSuggestionsForTheme(theme),
        affirmation: _getAffirmationForTheme(theme),
      );

      final docRef = _firestore
          .collection('timing_cycles')
          .doc(userId)
          .collection('cycles')
          .doc(id);

      batch.set(docRef, cycle.toJson());

      // Gap or overlap logic
      final gap = random.nextInt(10) - 3; // -3 to 6 days overlap/gap
      currentStart = endDate.add(Duration(days: gap));
    }

    await batch.commit();
  }

  String _getTitleForTheme(String theme, Random random) {
    const titles = {
      'relationships': [
        'Connection Deepening',
        'Social Expansion',
        'Relationship Harmony',
        'Family Bonds'
      ],
      'career': [
        'Professional Growth',
        'Focus & Discipline',
        'Career Clarity',
        'Leadership Moment'
      ],
      'personal_growth': [
        'Inner Transformation',
        'Self-Discovery',
        'Wisdom Gathering',
        'Identity Shift'
      ],
      'health': [
        'Vitality Boost',
        'Rest & Recovery',
        'Physical Strength',
        'Wellness Reset'
      ],
      'creativity': [
        'Creative Flow',
        'Artistic Expression',
        'Innovation Peak',
        'Inspiration Wave'
      ]
    };
    final list = titles[theme] ?? ['Unknown Cycle'];
    return list[random.nextInt(list.length)];
  }

  String _getDescriptionForTheme(String theme) {
    switch (theme) {
      case 'relationships':
        return "This period highlights your connections with others. It's a favorable time for deepening bonds, resolving conflicts, and expanding your social circle.";
      case 'career':
        return "Your professional life takes center stage. Focus on your long-term goals, take initiative on projects, and be open to new opportunities for advancement.";
      case 'personal_growth':
        return "A time for introspection and self-improvement. You may feel a strong urge to learn new things, challenge your beliefs, or redefine your personal identity.";
      case 'health':
        return "Pay attention to your physical and mental well-being. Prioritize rest, nutrition, and activities that replenish your energy reserves.";
      case 'creativity':
        return "Your imagination is heightened. Engage in artistic pursuits, brainstorm new ideas, or approach daily problems with fresh, innovative solutions.";
      default:
        return "A significant astrological transit affecting this area of your life.";
    }
  }

  List<String> _getSuggestionsForTheme(String theme) {
    switch (theme) {
      case 'relationships':
        return [
          'Schedule quality time with loved ones.',
          'Practice active listening.',
          'Reach out to an old friend.'
        ];
      case 'career':
        return [
          'Update your professional goals.',
          'Network with industry peers.',
          'Tackle a challenging task early within the day.'
        ];
      case 'personal_growth':
        return [
          'Start a daily journal.',
          'Read a book on a new topic.',
          'Meditate for 10 minutes daily.'
        ];
      case 'health':
        return [
          'Get 8 hours of sleep.',
          'Drink more water.',
          'Go for a nature walk.'
        ];
      case 'creativity':
        return [
          'Sketch or doodle freely.',
          'Write down your dreams.',
          'Try a new hobby.'
        ];
      default:
        return ['Stay mindful.', 'Reflect on your day.'];
    }
  }

  String _getAffirmationForTheme(String theme) {
    switch (theme) {
      case 'relationships':
        return "I attract positive and loving relationships into my life.";
      case 'career':
        return "I am capable, confident, and moving towards my goals.";
      case 'personal_growth':
        return "I am evolving into the best version of myself.";
      case 'health':
        return "My body is strong, healthy, and full of energy.";
      case 'creativity':
        return "I am a channel for infinite creativity and inspiration.";
      default:
        return "I trust the timing of my life.";
    }
  }
}
