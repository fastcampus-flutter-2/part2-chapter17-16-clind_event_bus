// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      company: json['company'] as String? ?? '',
      name: json['name'] as String? ?? '',
      postCount: json['postCount'] as int? ?? 0,
      commentCount: json['commentCount'] as int? ?? 0,
      likeCount: json['likeCount'] as int? ?? 0,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'company': instance.company,
      'name': instance.name,
      'postCount': instance.postCount,
      'commentCount': instance.commentCount,
      'likeCount': instance.likeCount,
    };
