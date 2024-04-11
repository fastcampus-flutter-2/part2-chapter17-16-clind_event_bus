import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

import 'api/api.dart';

void main(List<String> args) async {
  final Router router = Router();

  // post
  router.get('/post-api/channel/<id>', channelHandler);
  router.get('/post-api/channels', channelsHandler);
  router.get('/post-api/popular/channels', popularChannelsHandler);
  router.get('/post-api/post/<id>', postHandler);
  router.post('/post-api/post/create', createPostHandler);
  router.get('/post-api/posts', postsHandler);
  router.get('/post-api/posts/search', searchPostsHandler);
  router.get('/post-api/comments/<postId>', commentsHandler);

  // notification
  router.get('/notification-api/notifications', notificationsHandler);

  // profile
  router.get('/profile-api/my', myHandler);

  final SwaggerUI swaggerUI = SwaggerUI('specs/swagger.yaml', title: 'Clind API');
  final Handler handler = Cascade().add(router.call).add(swaggerUI.call).handler;
  final HttpServer server = await serve(handler, '127.0.0.1', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}
