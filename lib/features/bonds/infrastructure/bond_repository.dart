import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/bonds/domain/bond.dart';
import 'package:life_pattern/features/bonds/domain/offline_profile.dart';

class BondRepository {
  final FirebaseFirestore _firestore;

  BondRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  // ---------------------------------------------------------------------------
  // Bonds
  // ---------------------------------------------------------------------------

  /// Stream bonds for a user
  Stream<List<Bond>> watchBonds(String userId) {
    return _firestore
        .collection('bonds')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Bond.fromJson(doc.data())).toList();
    });
  }

  /// Create a new bond
  Future<void> createBond(Bond bond) async {
    await _firestore.collection('bonds').doc(bond.id).set(bond.toJson());
  }

  /// Delete a bond
  Future<void> deleteBond(String bondId) async {
    await _firestore.collection('bonds').doc(bondId).delete();
  }

  // ---------------------------------------------------------------------------
  // Offline Profiles
  // ---------------------------------------------------------------------------

  /// Stream offline profiles created by user
  Stream<List<OfflineProfile>> watchOfflineProfiles(String userId) {
    return _firestore
        .collection('offline_profiles')
        .where('createdByUserId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => OfflineProfile.fromJson(doc.data()))
          .toList();
    });
  }

  /// Create an offline profile
  Future<void> createOfflineProfile(OfflineProfile profile) async {
    await _firestore
        .collection('offline_profiles')
        .doc(profile.id)
        .set(profile.toJson());
  }

  // ---------------------------------------------------------------------------
  // User Search
  // ---------------------------------------------------------------------------

  /// Search for users by display name (simple prefix search)
  Future<List<Map<String, dynamic>>> searchUsers(String query) async {
    if (query.isEmpty) return [];

    final snapshot = await _firestore
        .collection('users')
        .where('displayName', isGreaterThanOrEqualTo: query)
        .where('displayName', isLessThan: '${query}z')
        .limit(10)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return {
        'id': doc.id,
        'displayName': data['displayName'] ?? 'Unknown',
        'email': data['email'],
      };
    }).toList();
  }
}
