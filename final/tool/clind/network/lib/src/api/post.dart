import 'package:tool_clind_network/network.dart';

class PostApi {
  final ClindRestClient _client;

  const PostApi(this._client);

  Future<dynamic> getChannels() {
    return _client.get<dynamic>('/post-api/channels').then((value) => value.data);
  }

  Future<dynamic> getPopularChannels() {
    return _client.get<dynamic>('/post-api/popular/channels').then((value) => value.data);
  }

  Future<dynamic> getPosts({
    int? take,
    int? page,
  }) {
    return _client.get<dynamic>(
      '/post-api/posts',
      queryParameters: {
        if (take != null) 'take': take,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> createPost({
    required String channel,
    required String title,
    required String content,
  }) {
    return _client.post<dynamic>(
      '/post-api/post/create',
      data: {
        'channel': channel,
        'title': title,
        'content': content,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getPost({
    required String id,
  }) {
    return _client.get<dynamic>('/post-api/post/$id').then((value) => value.data);
  }

  Future<dynamic> getComments({
    required String postId,
    int? take,
    int? page,
  }) {
    return _client.get<dynamic>(
      '/post-api/comments/$postId',
      queryParameters: {
        if (take != null) 'take': take,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getSearchPosts({
    String query = '',
    int? take,
    int? page,
  }) {
    return _client.get<dynamic>(
      '/post-api/posts/search',
      queryParameters: {
        'query': query,
        if (take != null) 'take': take,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }
}
