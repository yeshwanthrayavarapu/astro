// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bond {
  String get id;
  String get userId; // primary user
  String get otherProfileId; // can be another user or offline profile
  String get otherName;
  DateTime? get otherDateOfBirth; // if offline profile
  BondScores get scores;
  List<String> get labels; // e.g., ['intense', 'challenging', 'transformative']
  String get summary;
  BondDynamics get dynamics;
  @TimestampConverter()
  DateTime get createdAt;
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of Bond
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BondCopyWith<Bond> get copyWith =>
      _$BondCopyWithImpl<Bond>(this as Bond, _$identity);

  /// Serializes this Bond to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bond &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.otherProfileId, otherProfileId) ||
                other.otherProfileId == otherProfileId) &&
            (identical(other.otherName, otherName) ||
                other.otherName == otherName) &&
            (identical(other.otherDateOfBirth, otherDateOfBirth) ||
                other.otherDateOfBirth == otherDateOfBirth) &&
            (identical(other.scores, scores) || other.scores == scores) &&
            const DeepCollectionEquality().equals(other.labels, labels) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.dynamics, dynamics) ||
                other.dynamics == dynamics) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      otherProfileId,
      otherName,
      otherDateOfBirth,
      scores,
      const DeepCollectionEquality().hash(labels),
      summary,
      dynamics,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Bond(id: $id, userId: $userId, otherProfileId: $otherProfileId, otherName: $otherName, otherDateOfBirth: $otherDateOfBirth, scores: $scores, labels: $labels, summary: $summary, dynamics: $dynamics, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $BondCopyWith<$Res> {
  factory $BondCopyWith(Bond value, $Res Function(Bond) _then) =
      _$BondCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String otherProfileId,
      String otherName,
      DateTime? otherDateOfBirth,
      BondScores scores,
      List<String> labels,
      String summary,
      BondDynamics dynamics,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime? updatedAt});

  $BondScoresCopyWith<$Res> get scores;
  $BondDynamicsCopyWith<$Res> get dynamics;
}

/// @nodoc
class _$BondCopyWithImpl<$Res> implements $BondCopyWith<$Res> {
  _$BondCopyWithImpl(this._self, this._then);

  final Bond _self;
  final $Res Function(Bond) _then;

  /// Create a copy of Bond
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? otherProfileId = null,
    Object? otherName = null,
    Object? otherDateOfBirth = freezed,
    Object? scores = null,
    Object? labels = null,
    Object? summary = null,
    Object? dynamics = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      otherProfileId: null == otherProfileId
          ? _self.otherProfileId
          : otherProfileId // ignore: cast_nullable_to_non_nullable
              as String,
      otherName: null == otherName
          ? _self.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as String,
      otherDateOfBirth: freezed == otherDateOfBirth
          ? _self.otherDateOfBirth
          : otherDateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scores: null == scores
          ? _self.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as BondScores,
      labels: null == labels
          ? _self.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      dynamics: null == dynamics
          ? _self.dynamics
          : dynamics // ignore: cast_nullable_to_non_nullable
              as BondDynamics,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of Bond
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BondScoresCopyWith<$Res> get scores {
    return $BondScoresCopyWith<$Res>(_self.scores, (value) {
      return _then(_self.copyWith(scores: value));
    });
  }

  /// Create a copy of Bond
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BondDynamicsCopyWith<$Res> get dynamics {
    return $BondDynamicsCopyWith<$Res>(_self.dynamics, (value) {
      return _then(_self.copyWith(dynamics: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Bond].
extension BondPatterns on Bond {
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
    TResult Function(_Bond value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Bond() when $default != null:
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
    TResult Function(_Bond value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bond():
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
    TResult? Function(_Bond value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bond() when $default != null:
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
            String userId,
            String otherProfileId,
            String otherName,
            DateTime? otherDateOfBirth,
            BondScores scores,
            List<String> labels,
            String summary,
            BondDynamics dynamics,
            @TimestampConverter() DateTime createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Bond() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.otherProfileId,
            _that.otherName,
            _that.otherDateOfBirth,
            _that.scores,
            _that.labels,
            _that.summary,
            _that.dynamics,
            _that.createdAt,
            _that.updatedAt);
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
            String userId,
            String otherProfileId,
            String otherName,
            DateTime? otherDateOfBirth,
            BondScores scores,
            List<String> labels,
            String summary,
            BondDynamics dynamics,
            @TimestampConverter() DateTime createdAt,
            @TimestampConverter() DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bond():
        return $default(
            _that.id,
            _that.userId,
            _that.otherProfileId,
            _that.otherName,
            _that.otherDateOfBirth,
            _that.scores,
            _that.labels,
            _that.summary,
            _that.dynamics,
            _that.createdAt,
            _that.updatedAt);
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
            String userId,
            String otherProfileId,
            String otherName,
            DateTime? otherDateOfBirth,
            BondScores scores,
            List<String> labels,
            String summary,
            BondDynamics dynamics,
            @TimestampConverter() DateTime createdAt,
            @TimestampConverter() DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Bond() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.otherProfileId,
            _that.otherName,
            _that.otherDateOfBirth,
            _that.scores,
            _that.labels,
            _that.summary,
            _that.dynamics,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Bond implements Bond {
  const _Bond(
      {required this.id,
      required this.userId,
      required this.otherProfileId,
      required this.otherName,
      this.otherDateOfBirth,
      required this.scores,
      required final List<String> labels,
      required this.summary,
      required this.dynamics,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() this.updatedAt})
      : _labels = labels;
  factory _Bond.fromJson(Map<String, dynamic> json) => _$BondFromJson(json);

  @override
  final String id;
  @override
  final String userId;
// primary user
  @override
  final String otherProfileId;
// can be another user or offline profile
  @override
  final String otherName;
  @override
  final DateTime? otherDateOfBirth;
// if offline profile
  @override
  final BondScores scores;
  final List<String> _labels;
  @override
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

// e.g., ['intense', 'challenging', 'transformative']
  @override
  final String summary;
  @override
  final BondDynamics dynamics;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  /// Create a copy of Bond
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BondCopyWith<_Bond> get copyWith =>
      __$BondCopyWithImpl<_Bond>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BondToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bond &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.otherProfileId, otherProfileId) ||
                other.otherProfileId == otherProfileId) &&
            (identical(other.otherName, otherName) ||
                other.otherName == otherName) &&
            (identical(other.otherDateOfBirth, otherDateOfBirth) ||
                other.otherDateOfBirth == otherDateOfBirth) &&
            (identical(other.scores, scores) || other.scores == scores) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.dynamics, dynamics) ||
                other.dynamics == dynamics) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      otherProfileId,
      otherName,
      otherDateOfBirth,
      scores,
      const DeepCollectionEquality().hash(_labels),
      summary,
      dynamics,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Bond(id: $id, userId: $userId, otherProfileId: $otherProfileId, otherName: $otherName, otherDateOfBirth: $otherDateOfBirth, scores: $scores, labels: $labels, summary: $summary, dynamics: $dynamics, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$BondCopyWith<$Res> implements $BondCopyWith<$Res> {
  factory _$BondCopyWith(_Bond value, $Res Function(_Bond) _then) =
      __$BondCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String otherProfileId,
      String otherName,
      DateTime? otherDateOfBirth,
      BondScores scores,
      List<String> labels,
      String summary,
      BondDynamics dynamics,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime? updatedAt});

  @override
  $BondScoresCopyWith<$Res> get scores;
  @override
  $BondDynamicsCopyWith<$Res> get dynamics;
}

/// @nodoc
class __$BondCopyWithImpl<$Res> implements _$BondCopyWith<$Res> {
  __$BondCopyWithImpl(this._self, this._then);

  final _Bond _self;
  final $Res Function(_Bond) _then;

  /// Create a copy of Bond
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? otherProfileId = null,
    Object? otherName = null,
    Object? otherDateOfBirth = freezed,
    Object? scores = null,
    Object? labels = null,
    Object? summary = null,
    Object? dynamics = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_Bond(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      otherProfileId: null == otherProfileId
          ? _self.otherProfileId
          : otherProfileId // ignore: cast_nullable_to_non_nullable
              as String,
      otherName: null == otherName
          ? _self.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as String,
      otherDateOfBirth: freezed == otherDateOfBirth
          ? _self.otherDateOfBirth
          : otherDateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scores: null == scores
          ? _self.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as BondScores,
      labels: null == labels
          ? _self._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      dynamics: null == dynamics
          ? _self.dynamics
          : dynamics // ignore: cast_nullable_to_non_nullable
              as BondDynamics,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of Bond
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BondScoresCopyWith<$Res> get scores {
    return $BondScoresCopyWith<$Res>(_self.scores, (value) {
      return _then(_self.copyWith(scores: value));
    });
  }

  /// Create a copy of Bond
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BondDynamicsCopyWith<$Res> get dynamics {
    return $BondDynamicsCopyWith<$Res>(_self.dynamics, (value) {
      return _then(_self.copyWith(dynamics: value));
    });
  }
}

/// @nodoc
mixin _$BondScores {
  int get emotional; // 0-100
  int get intellectual; // 0-100
  int get communication; // 0-100
  int get values; // 0-100
  int get longTerm; // 0-100
  int get overall;

  /// Create a copy of BondScores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BondScoresCopyWith<BondScores> get copyWith =>
      _$BondScoresCopyWithImpl<BondScores>(this as BondScores, _$identity);

  /// Serializes this BondScores to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BondScores &&
            (identical(other.emotional, emotional) ||
                other.emotional == emotional) &&
            (identical(other.intellectual, intellectual) ||
                other.intellectual == intellectual) &&
            (identical(other.communication, communication) ||
                other.communication == communication) &&
            (identical(other.values, values) || other.values == values) &&
            (identical(other.longTerm, longTerm) ||
                other.longTerm == longTerm) &&
            (identical(other.overall, overall) || other.overall == overall));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, emotional, intellectual,
      communication, values, longTerm, overall);

  @override
  String toString() {
    return 'BondScores(emotional: $emotional, intellectual: $intellectual, communication: $communication, values: $values, longTerm: $longTerm, overall: $overall)';
  }
}

/// @nodoc
abstract mixin class $BondScoresCopyWith<$Res> {
  factory $BondScoresCopyWith(
          BondScores value, $Res Function(BondScores) _then) =
      _$BondScoresCopyWithImpl;
  @useResult
  $Res call(
      {int emotional,
      int intellectual,
      int communication,
      int values,
      int longTerm,
      int overall});
}

/// @nodoc
class _$BondScoresCopyWithImpl<$Res> implements $BondScoresCopyWith<$Res> {
  _$BondScoresCopyWithImpl(this._self, this._then);

  final BondScores _self;
  final $Res Function(BondScores) _then;

  /// Create a copy of BondScores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotional = null,
    Object? intellectual = null,
    Object? communication = null,
    Object? values = null,
    Object? longTerm = null,
    Object? overall = null,
  }) {
    return _then(_self.copyWith(
      emotional: null == emotional
          ? _self.emotional
          : emotional // ignore: cast_nullable_to_non_nullable
              as int,
      intellectual: null == intellectual
          ? _self.intellectual
          : intellectual // ignore: cast_nullable_to_non_nullable
              as int,
      communication: null == communication
          ? _self.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as int,
      values: null == values
          ? _self.values
          : values // ignore: cast_nullable_to_non_nullable
              as int,
      longTerm: null == longTerm
          ? _self.longTerm
          : longTerm // ignore: cast_nullable_to_non_nullable
              as int,
      overall: null == overall
          ? _self.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [BondScores].
extension BondScoresPatterns on BondScores {
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
    TResult Function(_BondScores value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BondScores() when $default != null:
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
    TResult Function(_BondScores value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BondScores():
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
    TResult? Function(_BondScores value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BondScores() when $default != null:
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
    TResult Function(int emotional, int intellectual, int communication,
            int values, int longTerm, int overall)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BondScores() when $default != null:
        return $default(_that.emotional, _that.intellectual,
            _that.communication, _that.values, _that.longTerm, _that.overall);
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
    TResult Function(int emotional, int intellectual, int communication,
            int values, int longTerm, int overall)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BondScores():
        return $default(_that.emotional, _that.intellectual,
            _that.communication, _that.values, _that.longTerm, _that.overall);
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
    TResult? Function(int emotional, int intellectual, int communication,
            int values, int longTerm, int overall)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BondScores() when $default != null:
        return $default(_that.emotional, _that.intellectual,
            _that.communication, _that.values, _that.longTerm, _that.overall);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BondScores implements BondScores {
  const _BondScores(
      {required this.emotional,
      required this.intellectual,
      required this.communication,
      required this.values,
      required this.longTerm,
      required this.overall});
  factory _BondScores.fromJson(Map<String, dynamic> json) =>
      _$BondScoresFromJson(json);

  @override
  final int emotional;
// 0-100
  @override
  final int intellectual;
// 0-100
  @override
  final int communication;
// 0-100
  @override
  final int values;
// 0-100
  @override
  final int longTerm;
// 0-100
  @override
  final int overall;

  /// Create a copy of BondScores
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BondScoresCopyWith<_BondScores> get copyWith =>
      __$BondScoresCopyWithImpl<_BondScores>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BondScoresToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BondScores &&
            (identical(other.emotional, emotional) ||
                other.emotional == emotional) &&
            (identical(other.intellectual, intellectual) ||
                other.intellectual == intellectual) &&
            (identical(other.communication, communication) ||
                other.communication == communication) &&
            (identical(other.values, values) || other.values == values) &&
            (identical(other.longTerm, longTerm) ||
                other.longTerm == longTerm) &&
            (identical(other.overall, overall) || other.overall == overall));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, emotional, intellectual,
      communication, values, longTerm, overall);

  @override
  String toString() {
    return 'BondScores(emotional: $emotional, intellectual: $intellectual, communication: $communication, values: $values, longTerm: $longTerm, overall: $overall)';
  }
}

/// @nodoc
abstract mixin class _$BondScoresCopyWith<$Res>
    implements $BondScoresCopyWith<$Res> {
  factory _$BondScoresCopyWith(
          _BondScores value, $Res Function(_BondScores) _then) =
      __$BondScoresCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int emotional,
      int intellectual,
      int communication,
      int values,
      int longTerm,
      int overall});
}

/// @nodoc
class __$BondScoresCopyWithImpl<$Res> implements _$BondScoresCopyWith<$Res> {
  __$BondScoresCopyWithImpl(this._self, this._then);

  final _BondScores _self;
  final $Res Function(_BondScores) _then;

  /// Create a copy of BondScores
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? emotional = null,
    Object? intellectual = null,
    Object? communication = null,
    Object? values = null,
    Object? longTerm = null,
    Object? overall = null,
  }) {
    return _then(_BondScores(
      emotional: null == emotional
          ? _self.emotional
          : emotional // ignore: cast_nullable_to_non_nullable
              as int,
      intellectual: null == intellectual
          ? _self.intellectual
          : intellectual // ignore: cast_nullable_to_non_nullable
              as int,
      communication: null == communication
          ? _self.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as int,
      values: null == values
          ? _self.values
          : values // ignore: cast_nullable_to_non_nullable
              as int,
      longTerm: null == longTerm
          ? _self.longTerm
          : longTerm // ignore: cast_nullable_to_non_nullable
              as int,
      overall: null == overall
          ? _self.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$BondDynamics {
  String get strengths;
  String get challenges;
  String get advice;
  List<String> get tips;

  /// Create a copy of BondDynamics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BondDynamicsCopyWith<BondDynamics> get copyWith =>
      _$BondDynamicsCopyWithImpl<BondDynamics>(
          this as BondDynamics, _$identity);

  /// Serializes this BondDynamics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BondDynamics &&
            (identical(other.strengths, strengths) ||
                other.strengths == strengths) &&
            (identical(other.challenges, challenges) ||
                other.challenges == challenges) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            const DeepCollectionEquality().equals(other.tips, tips));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, strengths, challenges, advice,
      const DeepCollectionEquality().hash(tips));

  @override
  String toString() {
    return 'BondDynamics(strengths: $strengths, challenges: $challenges, advice: $advice, tips: $tips)';
  }
}

/// @nodoc
abstract mixin class $BondDynamicsCopyWith<$Res> {
  factory $BondDynamicsCopyWith(
          BondDynamics value, $Res Function(BondDynamics) _then) =
      _$BondDynamicsCopyWithImpl;
  @useResult
  $Res call(
      {String strengths, String challenges, String advice, List<String> tips});
}

/// @nodoc
class _$BondDynamicsCopyWithImpl<$Res> implements $BondDynamicsCopyWith<$Res> {
  _$BondDynamicsCopyWithImpl(this._self, this._then);

  final BondDynamics _self;
  final $Res Function(BondDynamics) _then;

  /// Create a copy of BondDynamics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strengths = null,
    Object? challenges = null,
    Object? advice = null,
    Object? tips = null,
  }) {
    return _then(_self.copyWith(
      strengths: null == strengths
          ? _self.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as String,
      challenges: null == challenges
          ? _self.challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as String,
      advice: null == advice
          ? _self.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      tips: null == tips
          ? _self.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BondDynamics].
extension BondDynamicsPatterns on BondDynamics {
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
    TResult Function(_BondDynamics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BondDynamics() when $default != null:
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
    TResult Function(_BondDynamics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BondDynamics():
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
    TResult? Function(_BondDynamics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BondDynamics() when $default != null:
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
    TResult Function(String strengths, String challenges, String advice,
            List<String> tips)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BondDynamics() when $default != null:
        return $default(
            _that.strengths, _that.challenges, _that.advice, _that.tips);
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
    TResult Function(String strengths, String challenges, String advice,
            List<String> tips)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BondDynamics():
        return $default(
            _that.strengths, _that.challenges, _that.advice, _that.tips);
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
    TResult? Function(String strengths, String challenges, String advice,
            List<String> tips)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BondDynamics() when $default != null:
        return $default(
            _that.strengths, _that.challenges, _that.advice, _that.tips);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BondDynamics implements BondDynamics {
  const _BondDynamics(
      {required this.strengths,
      required this.challenges,
      required this.advice,
      required final List<String> tips})
      : _tips = tips;
  factory _BondDynamics.fromJson(Map<String, dynamic> json) =>
      _$BondDynamicsFromJson(json);

  @override
  final String strengths;
  @override
  final String challenges;
  @override
  final String advice;
  final List<String> _tips;
  @override
  List<String> get tips {
    if (_tips is EqualUnmodifiableListView) return _tips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tips);
  }

  /// Create a copy of BondDynamics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BondDynamicsCopyWith<_BondDynamics> get copyWith =>
      __$BondDynamicsCopyWithImpl<_BondDynamics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BondDynamicsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BondDynamics &&
            (identical(other.strengths, strengths) ||
                other.strengths == strengths) &&
            (identical(other.challenges, challenges) ||
                other.challenges == challenges) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            const DeepCollectionEquality().equals(other._tips, _tips));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, strengths, challenges, advice,
      const DeepCollectionEquality().hash(_tips));

  @override
  String toString() {
    return 'BondDynamics(strengths: $strengths, challenges: $challenges, advice: $advice, tips: $tips)';
  }
}

/// @nodoc
abstract mixin class _$BondDynamicsCopyWith<$Res>
    implements $BondDynamicsCopyWith<$Res> {
  factory _$BondDynamicsCopyWith(
          _BondDynamics value, $Res Function(_BondDynamics) _then) =
      __$BondDynamicsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String strengths, String challenges, String advice, List<String> tips});
}

/// @nodoc
class __$BondDynamicsCopyWithImpl<$Res>
    implements _$BondDynamicsCopyWith<$Res> {
  __$BondDynamicsCopyWithImpl(this._self, this._then);

  final _BondDynamics _self;
  final $Res Function(_BondDynamics) _then;

  /// Create a copy of BondDynamics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? strengths = null,
    Object? challenges = null,
    Object? advice = null,
    Object? tips = null,
  }) {
    return _then(_BondDynamics(
      strengths: null == strengths
          ? _self.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as String,
      challenges: null == challenges
          ? _self.challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as String,
      advice: null == advice
          ? _self.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      tips: null == tips
          ? _self._tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
