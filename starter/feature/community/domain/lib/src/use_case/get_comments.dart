import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class GetCommentsUseCase implements IUseCase<List<Comment>, GetCommentsParams> {
  final IPostRepository _postRepository;

  GetCommentsUseCase(this._postRepository);

  @override
  Future<List<Comment>> execute([GetCommentsParams? params]) async {
    if (params == null) return [];
    return _postRepository.getComments(
      postId: params.postId,
      take: params.take,
      page: params.page,
    );
  }
}

class GetCommentsParams {
  final String postId;
  final int take;
  final int page;

  GetCommentsParams({
    required this.postId,
    this.take = 10,
    this.page = 0,
  });
}
