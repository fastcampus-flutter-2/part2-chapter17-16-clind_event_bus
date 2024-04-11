import 'package:community_data/data.dart';

class PostDataSource {
  final IPostRemoteDataSource _postRemoteDataSource;

  PostDataSource(this._postRemoteDataSource);

  Future<dynamic> getPost({
    required String id,
  }) {
    return _postRemoteDataSource.getPost(
      id: id,
    );
  }

  Future<dynamic> getComments({
    required String postId,
    int? take,
    int? page,
  }) {
    return _postRemoteDataSource.getComments(
      postId: postId,
      take: take,
      page: page,
    );
  }
}
