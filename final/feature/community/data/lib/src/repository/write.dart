import 'package:community_data/data.dart';
import 'package:community_domain/domain.dart';

class WriteRepository implements IWriteRepository {
  final WriteDataSource _writeDataSource;

  WriteRepository(this._writeDataSource);

  @override
  Future<Post> createPost({
    required String channel,
    required String title,
    required String content,
  }) async {
    final dynamic json = await _writeDataSource.createPost(
      channel: channel,
      title: title,
      content: content,
    );
    return Post.fromJson(json);
  }

  @override
  Future<User> getMy() async {
    final dynamic json = await _writeDataSource.getMy();
    return User.fromJson(json);
  }
}
