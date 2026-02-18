// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfflineProfile {
  String get id;
  String get createdByUserId;
  String get name;
  @TimestampConverter()
  DateTime get dateOfBirth;
  @TimeOfDayConverter()
  TimeOfDay? get timeOfBirth;
  bool? get timeUnknown;
  String? get placeName;
  double? get latitude;
  double? get longitude;
  String? get timezone;
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of OfflineProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OfflineProfileCopyWith<OfflineProfile> get copyWith =>
      _$OfflineProfileCopyWithImpl<OfflineProfile>(
          this as OfflineProfile, _$identity);

  /// Serializes this OfflineProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OfflineProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.timeOfBirth, timeOfBirth) ||
                other.timeOfBirth == timeOfBirth) &&
            (identical(other.timeUnknown, timeUnknown) ||
                other.timeUnknown == timeUnknown) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdByUserId,
      name,
      dateOfBirth,
      timeOfBirth,
      timeUnknown,
      placeName,
      latitude,
      longitude,
      timezone,
      createdAt);

  @override
  String toString() {
    return 'OfflineProfile(id: $id, createdByUserId: $createdByUserId, name: $name, dateOfBirth: $dateOfBirth, timeOfBirth: $timeOfBirth, timeUnknown: $timeUnknown, placeName: $placeName, latitude: $latitude, longitude: $longitude, timezone: $timezone, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $OfflineProfileCopyWith<$Res> {
  factory $OfflineProfileCopyWith(
          OfflineProfile value, $Res Function(OfflineProfile) _then) =
      _$OfflineProfileCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String createdByUserId,
      String name,
      @TimestampConverter() DateTime dateOfBirth,
      @TimeOfDayConverter() TimeOfDay? timeOfBirth,
      bool? timeUnknown,
      String? placeName,
      double? latitude,
      double? longitude,
      String? timezone,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$OfflineProfileCopyWithImpl<$Res>
    implements $OfflineProfileCopyWith<$Res> {
  _$OfflineProfileCopyWithImpl(this._self, this._then);

  final OfflineProfile _self;
  final $Res Function(OfflineProfile) _then;

  /// Create a copy of OfflineProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdByUserId = null,
    Object? name = null,
    Object? dateOfBirth = null,
    Object? timeOfBirth = freezed,
    Object? timeUnknown = freezed,
    Object? placeName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? timezone = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUserId: null == createdByUserId
          ? _self.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeOfBirth: freezed == timeOfBirth
          ? _self.timeOfBirth
          : timeOfBirth // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      timeUnknown: freezed == timeUnknown
          ? _self.timeUnknown
          : timeUnknown // ignore: cast_nullable_to_non_nullable
              as bool?,
      placeName: freezed == placeName
          ? _self.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      timezone: freezed == timezone
          ? _self.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [OfflineProfile].
extension OfflineProfilePatterns on OfflineProfile {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OfflineProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfflineProfile() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OfflineProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineProfile():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OfflineProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineProfile() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String createdByUserId,
            String name,
            @TimestampConverter() DateTime dateOfBirth,
            @TimeOfDayConverter() TimeOfDay? timeOfBirth,
            bool? timeUnknown,
            String? placeName,
            double? latitude,
            double? longitude,
            String? timezone,
            @TimestampConverter() DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfflineProfile() when $default != null:
        return $default(
            _that.id,
            _that.createdByUserId,
            _that.name,
            _that.dateOfBirth,
            _that.timeOfBirth,
            _that.timeUnknown,
            _that.placeName,
            _that.latitude,
            _that.longitude,
            _that.timezone,
            _that.createdAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String createdByUserId,
            String name,
            @TimestampConverter() DateTime dateOfBirth,
            @TimeOfDayConverter() TimeOfDay? timeOfBirth,
            bool? timeUnknown,
            String? placeName,
            double? latitude,
            double? longitude,
            String? timezone,
            @TimestampConverter() DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineProfile():
        return $default(
            _that.id,
            _that.createdByUserId,
            _that.name,
            _that.dateOfBirth,
            _that.timeOfBirth,
            _that.timeUnknown,
            _that.placeName,
            _that.latitude,
            _that.longitude,
            _that.timezone,
            _that.createdAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String createdByUserId,
            String name,
            @TimestampConverter() DateTime dateOfBirth,
            @TimeOfDayConverter() TimeOfDay? timeOfBirth,
            bool? timeUnknown,
            String? placeName,
            double? latitude,
            double? longitude,
            String? timezone,
            @TimestampConverter() DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineProfile() when $default != null:
        return $default(
            _that.id,
            _that.createdByUserId,
            _that.name,
            _that.dateOfBirth,
            _that.timeOfBirth,
            _that.timeUnknown,
            _that.placeName,
            _that.latitude,
            _that.longitude,
            _that.timezone,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OfflineProfile implements OfflineProfile {
  const _OfflineProfile(
      {required this.id,
      required this.createdByUserId,
      required this.name,
      @TimestampConverter() required this.dateOfBirth,
      @TimeOfDayConverter() this.timeOfBirth,
      this.timeUnknown,
      this.placeName,
      this.latitude,
      this.longitude,
      this.timezone,
      @TimestampConverter() required this.createdAt});
  factory _OfflineProfile.fromJson(Map<String, dynamic> json) =>
      _$OfflineProfileFromJson(json);

  @override
  final String id;
  @override
  final String createdByUserId;
  @override
  final String name;
  @override
  @TimestampConverter()
  final DateTime dateOfBirth;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? timeOfBirth;
  @override
  final bool? timeUnknown;
  @override
  final String? placeName;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? timezone;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  /// Create a copy of OfflineProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OfflineProfileCopyWith<_OfflineProfile> get copyWith =>
      __$OfflineProfileCopyWithImpl<_OfflineProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OfflineProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfflineProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.timeOfBirth, timeOfBirth) ||
                other.timeOfBirth == timeOfBirth) &&
            (identical(other.timeUnknown, timeUnknown) ||
                other.timeUnknown == timeUnknown) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdByUserId,
      name,
      dateOfBirth,
      timeOfBirth,
      timeUnknown,
      placeName,
      latitude,
      longitude,
      timezone,
      createdAt);

  @override
  String toString() {
    return 'OfflineProfile(id: $id, createdByUserId: $createdByUserId, name: $name, dateOfBirth: $dateOfBirth, timeOfBirth: $timeOfBirth, timeUnknown: $timeUnknown, placeName: $placeName, latitude: $latitude, longitude: $longitude, timezone: $timezone, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$OfflineProfileCopyWith<$Res>
    implements $OfflineProfileCopyWith<$Res> {
  factory _$OfflineProfileCopyWith(
          _OfflineProfile value, $Res Function(_OfflineProfile) _then) =
      __$OfflineProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String createdByUserId,
      String name,
      @TimestampConverter() DateTime dateOfBirth,
      @TimeOfDayConverter() TimeOfDay? timeOfBirth,
      bool? timeUnknown,
      String? placeName,
      double? latitude,
      double? longitude,
      String? timezone,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$OfflineProfileCopyWithImpl<$Res>
    implements _$OfflineProfileCopyWith<$Res> {
  __$OfflineProfileCopyWithImpl(this._self, this._then);

  final _OfflineProfile _self;
  final $Res Function(_OfflineProfile) _then;

  /// Create a copy of OfflineProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? createdByUserId = null,
    Object? name = null,
    Object? dateOfBirth = null,
    Object? timeOfBirth = freezed,
    Object? timeUnknown = freezed,
    Object? placeName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? timezone = freezed,
    Object? createdAt = null,
  }) {
    return _then(_OfflineProfile(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUserId: null == createdByUserId
          ? _self.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeOfBirth: freezed == timeOfBirth
          ? _self.timeOfBirth
          : timeOfBirth // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      timeUnknown: freezed == timeUnknown
          ? _self.timeUnknown
          : timeUnknown // ignore: cast_nullable_to_non_nullable
              as bool?,
      placeName: freezed == placeName
          ? _self.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      timezone: freezed == timezone
          ? _self.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
