// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentItem {
  String get id;
  String get collectionId;
  String get title;
  String get subtitle;
  String get contentMarkdown;
  int get readTimeMinutes;
  bool get isPremium;
  int get sortOrder;
  List<String>? get tags;
  String? get imageUrl;
  @TimestampConverter()
  DateTime get publishedAt;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentItemCopyWith<ContentItem> get copyWith =>
      _$ContentItemCopyWithImpl<ContentItem>(this as ContentItem, _$identity);

  /// Serializes this ContentItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.contentMarkdown, contentMarkdown) ||
                other.contentMarkdown == contentMarkdown) &&
            (identical(other.readTimeMinutes, readTimeMinutes) ||
                other.readTimeMinutes == readTimeMinutes) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      collectionId,
      title,
      subtitle,
      contentMarkdown,
      readTimeMinutes,
      isPremium,
      sortOrder,
      const DeepCollectionEquality().hash(tags),
      imageUrl,
      publishedAt);

  @override
  String toString() {
    return 'ContentItem(id: $id, collectionId: $collectionId, title: $title, subtitle: $subtitle, contentMarkdown: $contentMarkdown, readTimeMinutes: $readTimeMinutes, isPremium: $isPremium, sortOrder: $sortOrder, tags: $tags, imageUrl: $imageUrl, publishedAt: $publishedAt)';
  }
}

/// @nodoc
abstract mixin class $ContentItemCopyWith<$Res> {
  factory $ContentItemCopyWith(
          ContentItem value, $Res Function(ContentItem) _then) =
      _$ContentItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String collectionId,
      String title,
      String subtitle,
      String contentMarkdown,
      int readTimeMinutes,
      bool isPremium,
      int sortOrder,
      List<String>? tags,
      String? imageUrl,
      @TimestampConverter() DateTime publishedAt});
}

/// @nodoc
class _$ContentItemCopyWithImpl<$Res> implements $ContentItemCopyWith<$Res> {
  _$ContentItemCopyWithImpl(this._self, this._then);

  final ContentItem _self;
  final $Res Function(ContentItem) _then;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectionId = null,
    Object? title = null,
    Object? subtitle = null,
    Object? contentMarkdown = null,
    Object? readTimeMinutes = null,
    Object? isPremium = null,
    Object? sortOrder = null,
    Object? tags = freezed,
    Object? imageUrl = freezed,
    Object? publishedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _self.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      contentMarkdown: null == contentMarkdown
          ? _self.contentMarkdown
          : contentMarkdown // ignore: cast_nullable_to_non_nullable
              as String,
      readTimeMinutes: null == readTimeMinutes
          ? _self.readTimeMinutes
          : readTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      isPremium: null == isPremium
          ? _self.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _self.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [ContentItem].
extension ContentItemPatterns on ContentItem {
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
    TResult Function(_ContentItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentItem() when $default != null:
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
    TResult Function(_ContentItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentItem():
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
    TResult? Function(_ContentItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentItem() when $default != null:
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
            String collectionId,
            String title,
            String subtitle,
            String contentMarkdown,
            int readTimeMinutes,
            bool isPremium,
            int sortOrder,
            List<String>? tags,
            String? imageUrl,
            @TimestampConverter() DateTime publishedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentItem() when $default != null:
        return $default(
            _that.id,
            _that.collectionId,
            _that.title,
            _that.subtitle,
            _that.contentMarkdown,
            _that.readTimeMinutes,
            _that.isPremium,
            _that.sortOrder,
            _that.tags,
            _that.imageUrl,
            _that.publishedAt);
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
            String collectionId,
            String title,
            String subtitle,
            String contentMarkdown,
            int readTimeMinutes,
            bool isPremium,
            int sortOrder,
            List<String>? tags,
            String? imageUrl,
            @TimestampConverter() DateTime publishedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentItem():
        return $default(
            _that.id,
            _that.collectionId,
            _that.title,
            _that.subtitle,
            _that.contentMarkdown,
            _that.readTimeMinutes,
            _that.isPremium,
            _that.sortOrder,
            _that.tags,
            _that.imageUrl,
            _that.publishedAt);
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
            String collectionId,
            String title,
            String subtitle,
            String contentMarkdown,
            int readTimeMinutes,
            bool isPremium,
            int sortOrder,
            List<String>? tags,
            String? imageUrl,
            @TimestampConverter() DateTime publishedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentItem() when $default != null:
        return $default(
            _that.id,
            _that.collectionId,
            _that.title,
            _that.subtitle,
            _that.contentMarkdown,
            _that.readTimeMinutes,
            _that.isPremium,
            _that.sortOrder,
            _that.tags,
            _that.imageUrl,
            _that.publishedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContentItem implements ContentItem {
  const _ContentItem(
      {required this.id,
      required this.collectionId,
      required this.title,
      required this.subtitle,
      required this.contentMarkdown,
      required this.readTimeMinutes,
      required this.isPremium,
      required this.sortOrder,
      final List<String>? tags,
      this.imageUrl,
      @TimestampConverter() required this.publishedAt})
      : _tags = tags;
  factory _ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);

  @override
  final String id;
  @override
  final String collectionId;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String contentMarkdown;
  @override
  final int readTimeMinutes;
  @override
  final bool isPremium;
  @override
  final int sortOrder;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? imageUrl;
  @override
  @TimestampConverter()
  final DateTime publishedAt;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentItemCopyWith<_ContentItem> get copyWith =>
      __$ContentItemCopyWithImpl<_ContentItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.contentMarkdown, contentMarkdown) ||
                other.contentMarkdown == contentMarkdown) &&
            (identical(other.readTimeMinutes, readTimeMinutes) ||
                other.readTimeMinutes == readTimeMinutes) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      collectionId,
      title,
      subtitle,
      contentMarkdown,
      readTimeMinutes,
      isPremium,
      sortOrder,
      const DeepCollectionEquality().hash(_tags),
      imageUrl,
      publishedAt);

  @override
  String toString() {
    return 'ContentItem(id: $id, collectionId: $collectionId, title: $title, subtitle: $subtitle, contentMarkdown: $contentMarkdown, readTimeMinutes: $readTimeMinutes, isPremium: $isPremium, sortOrder: $sortOrder, tags: $tags, imageUrl: $imageUrl, publishedAt: $publishedAt)';
  }
}

/// @nodoc
abstract mixin class _$ContentItemCopyWith<$Res>
    implements $ContentItemCopyWith<$Res> {
  factory _$ContentItemCopyWith(
          _ContentItem value, $Res Function(_ContentItem) _then) =
      __$ContentItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String collectionId,
      String title,
      String subtitle,
      String contentMarkdown,
      int readTimeMinutes,
      bool isPremium,
      int sortOrder,
      List<String>? tags,
      String? imageUrl,
      @TimestampConverter() DateTime publishedAt});
}

/// @nodoc
class __$ContentItemCopyWithImpl<$Res> implements _$ContentItemCopyWith<$Res> {
  __$ContentItemCopyWithImpl(this._self, this._then);

  final _ContentItem _self;
  final $Res Function(_ContentItem) _then;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? collectionId = null,
    Object? title = null,
    Object? subtitle = null,
    Object? contentMarkdown = null,
    Object? readTimeMinutes = null,
    Object? isPremium = null,
    Object? sortOrder = null,
    Object? tags = freezed,
    Object? imageUrl = freezed,
    Object? publishedAt = null,
  }) {
    return _then(_ContentItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _self.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      contentMarkdown: null == contentMarkdown
          ? _self.contentMarkdown
          : contentMarkdown // ignore: cast_nullable_to_non_nullable
              as String,
      readTimeMinutes: null == readTimeMinutes
          ? _self.readTimeMinutes
          : readTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      isPremium: null == isPremium
          ? _self.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _self.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
