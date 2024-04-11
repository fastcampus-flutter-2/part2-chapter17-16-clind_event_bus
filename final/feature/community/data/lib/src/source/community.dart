import 'package:community_data/data.dart';

class CommunityDataSource {
  final IPostRemoteDataSource _postRemoteDataSource;

  CommunityDataSource(this._postRemoteDataSource);

  Future<dynamic> getChannels() {
    return _postRemoteDataSource.getChannels();
  }

  Future<dynamic> getPopularChannels() {
    return _postRemoteDataSource.getPopularChannels();
  }

  Future<dynamic> getPosts({
    int? take,
    int? page,
  }) {
    return _postRemoteDataSource.getPosts(
      take: take,
      page: page,
    );
  }
}
