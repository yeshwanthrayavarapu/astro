// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentCollection {
  String get id;
  String get title;
  String get description;
  String? get imageUrl;
  String get category; // 'patterns', 'timing', 'relationships', 'growth'
  bool get isPremium;
  int get sortOrder;
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of ContentCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentCollectionCopyWith<ContentCollection> get copyWith =>
      _$ContentCollectionCopyWithImpl<ContentCollection>(
          this as ContentCollection, _$identity);

  /// Serializes this ContentCollection to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentCollection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, imageUrl,
      category, isPremium, sortOrder, createdAt);

  @override
  String toString() {
    return 'ContentCollection(id: $id, title: $title, description: $description, imageUrl: $imageUrl, category: $category, isPremium: $isPremium, sortOrder: $sortOrder, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ContentCollectionCopyWith<$Res> {
  factory $ContentCollectionCopyWith(
          ContentCollection value, $Res Function(ContentCollection) _then) =
      _$ContentCollectionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String? imageUrl,
      String category,
      bool isPremium,
      int sortOrder,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$ContentCollectionCopyWithImpl<$Res>
    implements $ContentCollectionCopyWith<$Res> {
  _$ContentCollectionCopyWithImpl(this._self, this._then);

  final ContentCollection _self;
  final $Res Function(ContentCollection) _then;

  /// Create a copy of ContentCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? category = null,
    Object? isPremium = null,
    Object? sortOrder = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _self.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [ContentCollection].
extension ContentCollectionPatterns on ContentCollection {
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
    TResult Function(_ContentCollection value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentCollection() when $default != null:
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
    TResult Function(_ContentCollection value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentCollection():
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
    TResult? Function(_ContentCollection value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentCollection() when $default != null:
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
            String title,
            String description,
            String? imageUrl,
            String category,
            bool isPremium,
            int sortOrder,
            @TimestampConverter() DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentCollection() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.imageUrl,
            _that.category,
            _that.isPremium,
            _that.sortOrder,
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
            String title,
            String description,
            String? imageUrl,
            String category,
            bool isPremium,
            int sortOrder,
            @TimestampConverter() DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentCollection():
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.imageUrl,
            _that.category,
            _that.isPremium,
            _that.sortOrder,
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
            String title,
            String description,
            String? imageUrl,
            String category,
            bool isPremium,
            int sortOrder,
            @TimestampConverter() DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentCollection() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.imageUrl,
            _that.category,
            _that.isPremium,
            _that.sortOrder,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContentCollection implements ContentCollection {
  const _ContentCollection(
      {required this.id,
      required this.title,
      required this.description,
      this.imageUrl,
      required this.category,
      required this.isPremium,
      required this.sortOrder,
      @TimestampConverter() required this.createdAt});
  factory _ContentCollection.fromJson(Map<String, dynamic> json) =>
      _$ContentCollectionFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String? imageUrl;
  @override
  final String category;
// 'patterns', 'timing', 'relationships', 'growth'
  @override
  final bool isPremium;
  @override
  final int sortOrder;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  /// Create a copy of ContentCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentCollectionCopyWith<_ContentCollection> get copyWith =>
      __$ContentCollectionCopyWithImpl<_ContentCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentCollectionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentCollection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, imageUrl,
      category, isPremium, sortOrder, createdAt);

  @override
  String toString() {
    return 'ContentCollection(id: $id, title: $title, description: $description, imageUrl: $imageUrl, category: $category, isPremium: $isPremium, sortOrder: $sortOrder, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ContentCollectionCopyWith<$Res>
    implements $ContentCollectionCopyWith<$Res> {
  factory _$ContentCollectionCopyWith(
          _ContentCollection value, $Res Function(_ContentCollection) _then) =
      __$ContentCollectionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String? imageUrl,
      String category,
      bool isPremium,
      int sortOrder,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$ContentCollectionCopyWithImpl<$Res>
    implements _$ContentCollectionCopyWith<$Res> {
  __$ContentCollectionCopyWithImpl(this._self, this._then);

  final _ContentCollection _self;
  final $Res Function(_ContentCollection) _then;

  /// Create a copy of ContentCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? category = null,
    Object? isPremium = null,
    Object? sortOrder = null,
    Object? createdAt = null,
  }) {
    return _then(_ContentCollection(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _self.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
