import 'package:community_domain/domain.dart';

abstract class IPostRepository {
  Future<Post> getPost({
    required String id,
  });

  Future<List<Comment>> getComments({
    required String postId,
    int take,
    int page,
  });
}
