// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      user: Profile.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String? ?? '',
      createdAt: json['createdAt'] as int? ?? 0,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'user': instance.user,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };
