import 'package:community_domain/domain.dart';

abstract class IWriteRepository {
  Future<Post> createPost({
    required String channel,
    required String title,
    required String content,
  });

  Future<User> getMy();
}
