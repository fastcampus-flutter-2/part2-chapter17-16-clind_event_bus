import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shelf/shelf.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String id;
  final String imageUrl;
  final String channel;
  final String company;
  final String title;
  final String content;
  final List<String> thumbnailUrls;
  final bool isLike;
  final int likeCount;
  final int commentCount;
  final int viewCount;
  final int createdAt;

  const Post({
    this.id = '',
    this.imageUrl = '',
    this.channel = '',
    this.company = '',
    this.title = '',
    this.content = '',
    this.thumbnailUrls = const [],
    this.isLike = false,
    this.likeCount = 0,
    this.commentCount = 0,
    this.viewCount = 0,
    this.createdAt = 0,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

final List<Post> posts = List.generate(
  100,
  (index) => Post(
    id: 'post_$index',
    imageUrl: 'https://source.unsplash.com/random/300×300',
    channel: Faker().conference.name(),
    company: Faker().company.name(),
    title: Faker().internet.userName(),
    content: Faker().address.city(),
    thumbnailUrls: index % 3 == 0
        ? ['https://source.unsplash.com/random/300×300', 'https://source.unsplash.com/random/300×300']
        : [],
    isLike: false,
    likeCount: index,
    commentCount: index,
    viewCount: Random().nextInt(100000000),
    createdAt: DateTime.now().subtract(Duration(minutes: index)).millisecondsSinceEpoch,
  ),
);

var postHandler = (Request request, String id) async {
  await Future.delayed(const Duration(seconds: 2));

  final Post post = posts.firstWhere(
    (item) => item.id == id,
    orElse: () => const Post(),
  );

  return Response.ok(
    jsonEncode(post.toJson()),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    },
  );
};

var postsHandler = (Request request) async {
  await Future.delayed(const Duration(seconds: 2));

  final String takeStr = request.url.queryParameters['take'] ?? '10';
  final String pageStr = request.url.queryParameters['page'] ?? '0';
  final int take = int.tryParse(takeStr) ?? 0;
  final int page = int.tryParse(pageStr) ?? 0;
  return Response.ok(
    jsonEncode(posts.skip(page * take).take(take).map((e) => e.toJson()).toList()),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    },
  );
};

var searchPostsHandler = (Request request) async {
  await Future.delayed(const Duration(seconds: 2));

  final String query = request.url.queryParameters['query'] ?? '';
  final String takeStr = request.url.queryParameters['take'] ?? '10';
  final String pageStr = request.url.queryParameters['page'] ?? '0';
  final int take = int.tryParse(takeStr) ?? 10;
  final int page = int.tryParse(pageStr) ?? 0;
  return Response.ok(
    jsonEncode(posts
        .where((e) => e.title.contains(query) || e.content.contains(query))
        .skip(page * take)
        .take(take)
        .map((e) => e.toJson())
        .toList()),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType
    },
  );
};

var createPostHandler = (Request request) async {
  await Future.delayed(const Duration(seconds: 2));

  final String payload = await request.readAsString();
  final Map<String, dynamic> json = jsonDecode(payload);
  final String channel = json['channel'] ?? '';
  final String title = json['title'] ?? '';
  final String content = json['content'] ?? '';

  final Map<String, dynamic> newPost = {
    'id': 'post_${DateTime.now().millisecondsSinceEpoch.toString()}',
    'channel': channel,
    'title': title,
    'content': content,
    'createdAt': DateTime.now().millisecondsSinceEpoch,
  };

  final Post post = Post.fromJson(newPost);
  posts.insert(0, post);

  return Response.ok(
    jsonEncode(post.toJson()),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    },
  );
};
