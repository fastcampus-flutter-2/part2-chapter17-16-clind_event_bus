import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default('') String id,
    @Default('') String postId,
    required User user,
    @Default('') String content,
    @JsonKey(fromJson: millisToDateTimeDefaultToday) required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}