import 'dart:convert';
import 'dart:io';

import 'package:faker/faker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shelf/shelf.dart';

import 'api.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final String id;
  final String postId;
  final Profile user;
  final String content;
  final int createdAt;

  const Comment({
    this.id = '',
    this.postId = '',
    required this.user,
    this.content = '',
    this.createdAt = 0,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

final List<Comment> comments = List.generate(
  100,
  (index) => Comment(
    id: 'channel_$index',
    postId: 'post_0',
    user: otherProfiles.firstWhere(
      (e) => e.id == 'other_profile_$index',
      orElse: () => const Profile(),
    ),
    content: Faker().conference.name(),
    createdAt: DateTime.now().subtract(Duration(minutes: index)).millisecondsSinceEpoch,
  ),
);

var commentsHandler = (Request request, String postId) async {
  await Future.delayed(const Duration(seconds: 2));

  final String takeStr = request.url.queryParameters['take'] ?? '10';
  final String pageStr = request.url.queryParameters['page'] ?? '0';
  final int take = int.tryParse(takeStr) ?? 10;
  final int page = int.tryParse(pageStr) ?? 0;
  return Response.ok(
    jsonEncode(
      comments.where((e) => e.postId == postId).skip(page * take).take(take).map((e) => e.toJson()).toList(),
    ),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    },
  );
};
