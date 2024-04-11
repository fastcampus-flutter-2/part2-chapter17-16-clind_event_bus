// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClindNotificationImpl _$$ClindNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$ClindNotificationImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      route: json['route'] as String? ?? '',
      createdAt: millisToDateTimeDefaultToday(json['createdAt'] as int?),
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
          NotificationType.unknown,
    );

Map<String, dynamic> _$$ClindNotificationImplToJson(
        _$ClindNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'route': instance.route,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$NotificationTypeEnumMap[instance.type]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.alarm: 'ALARM',
  NotificationType.notice: 'NOTICE',
  NotificationType.unknown: 'unknown',
};
