import 'package:core_util/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @Default('') String id,
    @Default('') String imageUrl,
    @Default('') String channel,
    @Default('') String company,
    @Default('') String title,
    @Default('') String content,
    @Default([]) List<String> thumbnailUrls,
    @Default(false) bool isLike,
    @Default(0) int likeCount,
    @Default(0) int commentCount,
    @Default(0) int viewCount,
    @JsonKey(fromJson: millisToDateTimeDefaultToday) required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.empty() {
    return Post(
      createdAt: DateTime.now(),
    );
  }
}