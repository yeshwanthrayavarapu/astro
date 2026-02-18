import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/birth_profile/domain/profile.dart';

/// Handles reading and writing [Profile] documents in Firestore.
class ProfileService {
  ProfileService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _profiles =>
      _firestore.collection('profiles');

  /// Returns the profile for [userId], or null if it doesn't exist yet.
  Future<Profile?> getProfile(String userId) async {
    final doc = await _profiles.doc(userId).get();
    if (!doc.exists || doc.data() == null) return null;
    return Profile.fromFirestore(doc.data()!);
  }

  /// Saves (creates or overwrites) the profile for [profile.userId].
  Future<void> saveProfile(Profile profile) async {
    await _profiles.doc(profile.userId).set(profile.toFirestore());
  }

  /// Stream of profile changes — useful for reactive UI.
  Stream<Profile?> profileStream(String userId) {
    return _profiles.doc(userId).snapshots().map((snap) {
      if (!snap.exists || snap.data() == null) return null;
      return Profile.fromFirestore(snap.data()!);
    });
  }
}
