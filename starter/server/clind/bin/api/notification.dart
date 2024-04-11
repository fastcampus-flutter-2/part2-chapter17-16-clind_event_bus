import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:shelf/shelf.dart';

part 'notification.g.dart';

@JsonEnum()
enum NotificationType {
  @JsonValue('ALARM')
  alarm,
  @JsonValue('NOTICE')
  notice;
}

@JsonSerializable()
class Notification {
  final String id;
  final String title;
  final String content;
  final String route;
  final int createdAt;
  final NotificationType type;

  Notification({
    this.id = '',
    this.title = '',
    this.content = '',
    this.route = '',
    this.createdAt = 0,
    this.type = NotificationType.alarm,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}

final List<Notification> notifications = [
  Notification(
    id: 'notification_0',
    title: '공지사항',
    content: '어떤 게시글이 있는지 확인해보세요.',
    route: '/community?type=normal',
    createdAt: DateTime.now().subtract(const Duration(minutes: 1)).millisecondsSinceEpoch,
    type: NotificationType.notice,
  ),
  Notification(
    id: 'notification_1',
    title: '공지사항',
    content: '많은 인기 게시글이 작성되었어요. 어떤 인기 게시글이 있는지 확인해보세요.',
    route: '/community?type=popular',
    createdAt: DateTime.now().subtract(const Duration(minutes: 3)).millisecondsSinceEpoch,
    type: NotificationType.notice,
  ),
  Notification(
    id: 'notification_2',
    title: '라운지 주간베스트!',
    content: '"능률 지원 마십시오."',
    createdAt: DateTime.now().subtract(const Duration(days: 1)).millisecondsSinceEpoch,
    route: '/community/post?id=post_0',
    type: NotificationType.alarm,
  ),
  Notification(
    id: 'notification_3',
    title: '토픽 주간베스트!',
    content: '"코로나로 인한 회사생활"',
    createdAt: DateTime.now().subtract(const Duration(days: 2)).millisecondsSinceEpoch,
    route: '/community/post?id=post_1',
    type: NotificationType.alarm,
  ),
];

var notificationsHandler = (Request request) async {
  await Future.delayed(const Duration(seconds: 2));

  return Response.ok(
    jsonEncode(notifications.map((e) => e.toJson()).toList()),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    },
  );
};
