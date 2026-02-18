import 'dart:math';

import 'package:life_pattern/features/birth_profile/domain/profile.dart';
import 'package:life_pattern/features/bonds/domain/bond.dart';
import 'package:life_pattern/features/bonds/domain/offline_profile.dart';

class CompatibilityService {
  /// Calculate compatibility scores between a user and an offline profile
  BondScores calculateOffline(Profile user, OfflineProfile other) {
    return _calculate(user.dateOfBirth, other.dateOfBirth);
  }

  /// Calculate compatibility scores between two users
  BondScores calculateUsers(Profile user, Profile other) {
    return _calculate(user.dateOfBirth, other.dateOfBirth);
  }

  /// Deterministic algorithm based on birth dates
  BondScores _calculate(DateTime dob1, DateTime dob2) {
    // Seed: Sum of timestamps ensures consistency for same pair (irrespective of order if sorted, but here order matters for 'user' vs 'other')
    // We want A+B to equal B+A, so sort them or sum them
    final t1 = dob1.millisecondsSinceEpoch;
    final t2 = dob2.millisecondsSinceEpoch;
    final seed = t1 + t2;

    final random = Random(seed);

    // Generate scores with variance
    // Base scores weighted slightly above average for better UX
    int emotional = 60 + random.nextInt(35); // 60-95
    int intellectual = 55 + random.nextInt(40); // 55-95
    int communication = 50 + random.nextInt(45); // 50-95
    int values = 65 + random.nextInt(30); // 65-95
    int longTerm = 60 + random.nextInt(35); // 60-95

    int overall =
        ((emotional + intellectual + communication + values + longTerm) / 5)
            .round();

    return BondScores(
      emotional: emotional,
      intellectual: intellectual,
      communication: communication,
      values: values,
      longTerm: longTerm,
      overall: overall,
    );
  }

  List<String> generateLabels(int overallScore) {
    if (overallScore >= 85) return ['Extraordinary', 'Powerful'];
    if (overallScore >= 70) return ['Strong', 'Harmonious'];
    if (overallScore >= 55) return ['Meaningful', 'Growth-Oriented'];
    if (overallScore >= 40) return ['Complex', 'Challenging'];
    return ['Difficult', 'Transformative'];
  }

  BondDynamics generateDynamics(int overallScore) {
    if (overallScore >= 80) {
      return const BondDynamics(
        strengths: "Natural understanding and deep connection.",
        challenges: "Staying grounded in reality due to high idealism.",
        advice: "Cherish this rare connection.",
        tips: ["Plan future goals together", "Express gratitude daily"],
      );
    } else if (overallScore >= 60) {
      return const BondDynamics(
        strengths: "Good balance of similarities and differences.",
        challenges: "Occasional miscommunication needs patience.",
        advice: "Focus on shared values.",
        tips: ["Practice active listening", "Find common hobbies"],
      );
    } else {
      return const BondDynamics(
        strengths: "Potential for massive personal growth.",
        challenges: "Fundamental differences in approach.",
        advice: "Respect each other's individuality.",
        tips: ["Agree to disagree", "Give each other space"],
      );
    }
  }
}
