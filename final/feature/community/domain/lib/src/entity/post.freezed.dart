// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get thumbnailUrls => throw _privateConstructorUsedError;
  bool get isLike => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String imageUrl,
      String channel,
      String company,
      String title,
      String content,
      List<String> thumbnailUrls,
      bool isLike,
      int likeCount,
      int commentCount,
      int viewCount,
      @JsonKey(fromJson: millisToDateTimeDefaultToday) DateTime createdAt});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? channel = null,
    Object? company = null,
    Object? title = null,
    Object? content = null,
    Object? thumbnailUrls = null,
    Object? isLike = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? viewCount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrls: null == thumbnailUrls
          ? _value.thumbnailUrls
          : thumbnailUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String imageUrl,
      String channel,
      String company,
      String title,
      String content,
      List<String> thumbnailUrls,
      bool isLike,
      int likeCount,
      int commentCount,
      int viewCount,
      @JsonKey(fromJson: millisToDateTimeDefaultToday) DateTime createdAt});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? channel = null,
    Object? company = null,
    Object? title = null,
    Object? content = null,
    Object? thumbnailUrls = null,
    Object? isLike = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? viewCount = null,
    Object? createdAt = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrls: null == thumbnailUrls
          ? _value._thumbnailUrls
          : thumbnailUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {this.id = '',
      this.imageUrl = '',
      this.channel = '',
      this.company = '',
      this.title = '',
      this.content = '',
      final List<String> thumbnailUrls = const [],
      this.isLike = false,
      this.likeCount = 0,
      this.commentCount = 0,
      this.viewCount = 0,
      @JsonKey(fromJson: millisToDateTimeDefaultToday) required this.createdAt})
      : _thumbnailUrls = thumbnailUrls;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String channel;
  @override
  @JsonKey()
  final String company;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;
  final List<String> _thumbnailUrls;
  @override
  @JsonKey()
  List<String> get thumbnailUrls {
    if (_thumbnailUrls is EqualUnmodifiableListView) return _thumbnailUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnailUrls);
  }

  @override
  @JsonKey()
  final bool isLike;
  @override
  @JsonKey()
  final int likeCount;
  @override
  @JsonKey()
  final int commentCount;
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  final DateTime createdAt;

  @override
  String toString() {
    return 'Post(id: $id, imageUrl: $imageUrl, channel: $channel, company: $company, title: $title, content: $content, thumbnailUrls: $thumbnailUrls, isLike: $isLike, likeCount: $likeCount, commentCount: $commentCount, viewCount: $viewCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._thumbnailUrls, _thumbnailUrls) &&
            (identical(other.isLike, isLike) || other.isLike == isLike) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      imageUrl,
      channel,
      company,
      title,
      content,
      const DeepCollectionEquality().hash(_thumbnailUrls),
      isLike,
      likeCount,
      commentCount,
      viewCount,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {final String id,
      final String imageUrl,
      final String channel,
      final String company,
      final String title,
      final String content,
      final List<String> thumbnailUrls,
      final bool isLike,
      final int likeCount,
      final int commentCount,
      final int viewCount,
      @JsonKey(fromJson: millisToDateTimeDefaultToday)
      required final DateTime createdAt}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get channel;
  @override
  String get company;
  @override
  String get title;
  @override
  String get content;
  @override
  List<String> get thumbnailUrls;
  @override
  bool get isLike;
  @override
  int get likeCount;
  @override
  int get commentCount;
  @override
  int get viewCount;
  @override
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
