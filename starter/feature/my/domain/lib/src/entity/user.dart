import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String id,
    @Default('') String imageUrl,
    @Default('') String company,
    @Default('') String name,
    @Default(0) int postCount,
    @Default(0) int commentCount,
    @Default(0) int likeCount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}