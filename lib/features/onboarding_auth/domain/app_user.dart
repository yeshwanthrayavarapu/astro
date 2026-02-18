import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents a LifePattern user stored in Firestore `users/{uid}`.
class AppUser {
  const AppUser({
    required this.uid,
    required this.createdAt,
    required this.lastLoginAt,
    required this.isAnonymous,
    required this.isPremium,
    required this.onboardingCompleted,
    this.email,
    this.displayName,
    this.photoUrl,
    this.phoneNumber,
  });

  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String? phoneNumber;
  final Timestamp createdAt;
  final Timestamp lastLoginAt;
  final bool isAnonymous;
  final bool isPremium;
  final bool onboardingCompleted;

  factory AppUser.fromFirestore(Map<String, dynamic> data) {
    return AppUser(
      uid: data['uid'] as String,
      email: data['email'] as String?,
      displayName: data['displayName'] as String?,
      photoUrl: data['photoUrl'] as String?,
      phoneNumber: data['phoneNumber'] as String?,
      createdAt: data['createdAt'] as Timestamp,
      lastLoginAt: data['lastLoginAt'] as Timestamp,
      isAnonymous: data['isAnonymous'] as bool? ?? false,
      isPremium: data['isPremium'] as bool? ?? false,
      onboardingCompleted: data['onboardingCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'uid': uid,
        'email': email,
        'displayName': displayName,
        'photoUrl': photoUrl,
        'phoneNumber': phoneNumber,
        'createdAt': createdAt,
        'lastLoginAt': lastLoginAt,
        'isAnonymous': isAnonymous,
        'isPremium': isPremium,
        'onboardingCompleted': onboardingCompleted,
      };

  AppUser copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
    Timestamp? createdAt,
    Timestamp? lastLoginAt,
    bool? isAnonymous,
    bool? isPremium,
    bool? onboardingCompleted,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      isPremium: isPremium ?? this.isPremium,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    );
  }
}
