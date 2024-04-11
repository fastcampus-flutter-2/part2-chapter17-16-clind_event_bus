// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String? ?? '',
      createdAt: millisToDateTimeDefaultToday(json['createdAt'] as int?),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'user': instance.user,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
    };
