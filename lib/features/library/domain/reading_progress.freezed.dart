// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadingProgress {
  String get userId;
  String get contentItemId;
  double get progressPercent; // 0-1.0
  @TimestampConverter()
  DateTime get lastReadAt;
  bool? get completed;

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReadingProgressCopyWith<ReadingProgress> get copyWith =>
      _$ReadingProgressCopyWithImpl<ReadingProgress>(
          this as ReadingProgress, _$identity);

  /// Serializes this ReadingProgress to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReadingProgress &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.contentItemId, contentItemId) ||
                other.contentItemId == contentItemId) &&
            (identical(other.progressPercent, progressPercent) ||
                other.progressPercent == progressPercent) &&
            (identical(other.lastReadAt, lastReadAt) ||
                other.lastReadAt == lastReadAt) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, contentItemId,
      progressPercent, lastReadAt, completed);

  @override
  String toString() {
    return 'ReadingProgress(userId: $userId, contentItemId: $contentItemId, progressPercent: $progressPercent, lastReadAt: $lastReadAt, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class $ReadingProgressCopyWith<$Res> {
  factory $ReadingProgressCopyWith(
          ReadingProgress value, $Res Function(ReadingProgress) _then) =
      _$ReadingProgressCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String contentItemId,
      double progressPercent,
      @TimestampConverter() DateTime lastReadAt,
      bool? completed});
}

/// @nodoc
class _$ReadingProgressCopyWithImpl<$Res>
    implements $ReadingProgressCopyWith<$Res> {
  _$ReadingProgressCopyWithImpl(this._self, this._then);

  final ReadingProgress _self;
  final $Res Function(ReadingProgress) _then;

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? contentItemId = null,
    Object? progressPercent = null,
    Object? lastReadAt = null,
    Object? completed = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      contentItemId: null == contentItemId
          ? _self.contentItemId
          : contentItemId // ignore: cast_nullable_to_non_nullable
              as String,
      progressPercent: null == progressPercent
          ? _self.progressPercent
          : progressPercent // ignore: cast_nullable_to_non_nullable
              as double,
      lastReadAt: null == lastReadAt
          ? _self.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completed: freezed == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReadingProgress].
extension ReadingProgressPatterns on ReadingProgress {
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
    TResult Function(_ReadingProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReadingProgress() when $default != null:
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
    TResult Function(_ReadingProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReadingProgress():
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
    TResult? Function(_ReadingProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReadingProgress() when $default != null:
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
            String userId,
            String contentItemId,
            double progressPercent,
            @TimestampConverter() DateTime lastReadAt,
            bool? completed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReadingProgress() when $default != null:
        return $default(_that.userId, _that.contentItemId,
            _that.progressPercent, _that.lastReadAt, _that.completed);
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
            String userId,
            String contentItemId,
            double progressPercent,
            @TimestampConverter() DateTime lastReadAt,
            bool? completed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReadingProgress():
        return $default(_that.userId, _that.contentItemId,
            _that.progressPercent, _that.lastReadAt, _that.completed);
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
            String userId,
            String contentItemId,
            double progressPercent,
            @TimestampConverter() DateTime lastReadAt,
            bool? completed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReadingProgress() when $default != null:
        return $default(_that.userId, _that.contentItemId,
            _that.progressPercent, _that.lastReadAt, _that.completed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReadingProgress implements ReadingProgress {
  const _ReadingProgress(
      {required this.userId,
      required this.contentItemId,
      required this.progressPercent,
      @TimestampConverter() required this.lastReadAt,
      this.completed});
  factory _ReadingProgress.fromJson(Map<String, dynamic> json) =>
      _$ReadingProgressFromJson(json);

  @override
  final String userId;
  @override
  final String contentItemId;
  @override
  final double progressPercent;
// 0-1.0
  @override
  @TimestampConverter()
  final DateTime lastReadAt;
  @override
  final bool? completed;

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReadingProgressCopyWith<_ReadingProgress> get copyWith =>
      __$ReadingProgressCopyWithImpl<_ReadingProgress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReadingProgressToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReadingProgress &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.contentItemId, contentItemId) ||
                other.contentItemId == contentItemId) &&
            (identical(other.progressPercent, progressPercent) ||
                other.progressPercent == progressPercent) &&
            (identical(other.lastReadAt, lastReadAt) ||
                other.lastReadAt == lastReadAt) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, contentItemId,
      progressPercent, lastReadAt, completed);

  @override
  String toString() {
    return 'ReadingProgress(userId: $userId, contentItemId: $contentItemId, progressPercent: $progressPercent, lastReadAt: $lastReadAt, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class _$ReadingProgressCopyWith<$Res>
    implements $ReadingProgressCopyWith<$Res> {
  factory _$ReadingProgressCopyWith(
          _ReadingProgress value, $Res Function(_ReadingProgress) _then) =
      __$ReadingProgressCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String contentItemId,
      double progressPercent,
      @TimestampConverter() DateTime lastReadAt,
      bool? completed});
}

/// @nodoc
class __$ReadingProgressCopyWithImpl<$Res>
    implements _$ReadingProgressCopyWith<$Res> {
  __$ReadingProgressCopyWithImpl(this._self, this._then);

  final _ReadingProgress _self;
  final $Res Function(_ReadingProgress) _then;

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? contentItemId = null,
    Object? progressPercent = null,
    Object? lastReadAt = null,
    Object? completed = freezed,
  }) {
    return _then(_ReadingProgress(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      contentItemId: null == contentItemId
          ? _self.contentItemId
          : contentItemId // ignore: cast_nullable_to_non_nullable
              as String,
      progressPercent: null == progressPercent
          ? _self.progressPercent
          : progressPercent // ignore: cast_nullable_to_non_nullable
              as double,
      lastReadAt: null == lastReadAt
          ? _self.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completed: freezed == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
