// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClindNotification _$ClindNotificationFromJson(Map<String, dynamic> json) {
  return _ClindNotification.fromJson(json);
}

/// @nodoc
mixin _$ClindNotification {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  DateTime get createdAt => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClindNotificationCopyWith<ClindNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClindNotificationCopyWith<$Res> {
  factory $ClindNotificationCopyWith(
          ClindNotification value, $Res Function(ClindNotification) then) =
      _$ClindNotificationCopyWithImpl<$Res, ClindNotification>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String route,
      @JsonKey(fromJson: millisToDateTimeDefaultToday) DateTime createdAt,
      NotificationType type});
}

/// @nodoc
class _$ClindNotificationCopyWithImpl<$Res, $Val extends ClindNotification>
    implements $ClindNotificationCopyWith<$Res> {
  _$ClindNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? route = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClindNotificationImplCopyWith<$Res>
    implements $ClindNotificationCopyWith<$Res> {
  factory _$$ClindNotificationImplCopyWith(_$ClindNotificationImpl value,
          $Res Function(_$ClindNotificationImpl) then) =
      __$$ClindNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String route,
      @JsonKey(fromJson: millisToDateTimeDefaultToday) DateTime createdAt,
      NotificationType type});
}

/// @nodoc
class __$$ClindNotificationImplCopyWithImpl<$Res>
    extends _$ClindNotificationCopyWithImpl<$Res, _$ClindNotificationImpl>
    implements _$$ClindNotificationImplCopyWith<$Res> {
  __$$ClindNotificationImplCopyWithImpl(_$ClindNotificationImpl _value,
      $Res Function(_$ClindNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? route = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(_$ClindNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClindNotificationImpl implements _ClindNotification {
  const _$ClindNotificationImpl(
      {this.id = '',
      this.title = '',
      this.content = '',
      this.route = '',
      @JsonKey(fromJson: millisToDateTimeDefaultToday) required this.createdAt,
      this.type = NotificationType.unknown});

  factory _$ClindNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClindNotificationImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String route;
  @override
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  final DateTime createdAt;
  @override
  @JsonKey()
  final NotificationType type;

  @override
  String toString() {
    return 'ClindNotification(id: $id, title: $title, content: $content, route: $route, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClindNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, route, createdAt, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClindNotificationImplCopyWith<_$ClindNotificationImpl> get copyWith =>
      __$$ClindNotificationImplCopyWithImpl<_$ClindNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClindNotificationImplToJson(
      this,
    );
  }
}

abstract class _ClindNotification implements ClindNotification {
  const factory _ClindNotification(
      {final String id,
      final String title,
      final String content,
      final String route,
      @JsonKey(fromJson: millisToDateTimeDefaultToday)
      required final DateTime createdAt,
      final NotificationType type}) = _$ClindNotificationImpl;

  factory _ClindNotification.fromJson(Map<String, dynamic> json) =
      _$ClindNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get route;
  @override
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  DateTime get createdAt;
  @override
  NotificationType get type;
  @override
  @JsonKey(ignore: true)
  _$$ClindNotificationImplCopyWith<_$ClindNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
