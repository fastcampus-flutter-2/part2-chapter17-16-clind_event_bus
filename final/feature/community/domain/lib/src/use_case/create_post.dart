import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class CreatePostUseCase implements IUseCase<Post, CreatePostParams> {
  final IWriteRepository _writeRepository;

  CreatePostUseCase(this._writeRepository);

  @override
  Future<Post> execute([CreatePostParams? params]) {
    final CreatePostParams input = params ?? CreatePostParams();
    return _writeRepository.createPost(
      channel: input.channel,
      title: input.title,
      content: input.content,
    );
  }
}

class CreatePostParams {
  final String channel;
  final String title;
  final String content;

  CreatePostParams({
    this.channel = '',
    this.title = '',
    this.content = '',
  });
}
