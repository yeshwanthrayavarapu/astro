import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents a user's birth profile stored in Firestore `profiles/{uid}`.
class Profile {
  const Profile({
    required this.userId,
    required this.dateOfBirth,
    required this.birthHour,
    required this.birthMinute,
    required this.timeUnknown,
    required this.placeName,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.createdAt,
    this.gender,
    this.relationshipStatus,
    this.updatedAt,
  });

  final String userId;

  /// Date of birth (time component is irrelevant — use birthHour/birthMinute).
  final DateTime dateOfBirth;

  /// Hour of birth in 24-hour format. Defaults to 12 when [timeUnknown] is true.
  final int birthHour;

  /// Minute of birth. Defaults to 0 when [timeUnknown] is true.
  final int birthMinute;

  /// Whether the exact birth time is unknown.
  final bool timeUnknown;

  /// Full display name from Nominatim, e.g. "Sydney, New South Wales, Australia".
  final String placeName;

  final double latitude;
  final double longitude;

  /// IANA timezone string, e.g. "Australia/Sydney".
  final String timezone;

  final String? gender;
  final String? relationshipStatus;

  final DateTime createdAt;
  final DateTime? updatedAt;

  // ---------------------------------------------------------------------------
  // Firestore serialisation
  // ---------------------------------------------------------------------------

  factory Profile.fromFirestore(Map<String, dynamic> data) {
    return Profile(
      userId: data['userId'] as String,
      dateOfBirth: (data['dateOfBirth'] as Timestamp).toDate(),
      birthHour: data['birthHour'] as int,
      birthMinute: data['birthMinute'] as int,
      timeUnknown: data['timeUnknown'] as bool? ?? false,
      placeName: data['placeName'] as String,
      latitude: (data['latitude'] as num).toDouble(),
      longitude: (data['longitude'] as num).toDouble(),
      timezone: data['timezone'] as String,
      gender: data['gender'] as String?,
      relationshipStatus: data['relationshipStatus'] as String?,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: data['updatedAt'] != null
          ? (data['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'userId': userId,
        'dateOfBirth': Timestamp.fromDate(dateOfBirth),
        'birthHour': birthHour,
        'birthMinute': birthMinute,
        'timeUnknown': timeUnknown,
        'placeName': placeName,
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
        'gender': gender,
        'relationshipStatus': relationshipStatus,
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      };

  Profile copyWith({
    String? userId,
    DateTime? dateOfBirth,
    int? birthHour,
    int? birthMinute,
    bool? timeUnknown,
    String? placeName,
    double? latitude,
    double? longitude,
    String? timezone,
    String? gender,
    String? relationshipStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Profile(
      userId: userId ?? this.userId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      birthHour: birthHour ?? this.birthHour,
      birthMinute: birthMinute ?? this.birthMinute,
      timeUnknown: timeUnknown ?? this.timeUnknown,
      placeName: placeName ?? this.placeName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
      gender: gender ?? this.gender,
      relationshipStatus: relationshipStatus ?? this.relationshipStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
