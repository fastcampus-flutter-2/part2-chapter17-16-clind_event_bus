import 'package:community_domain/domain.dart';

abstract class ICommunityRepository {
  Future<List<Channel>> getChannels();

  Future<List<Channel>> getPopularChannels();

  Future<List<Post>> getPosts({
    int take,
    int page,
  });
}
