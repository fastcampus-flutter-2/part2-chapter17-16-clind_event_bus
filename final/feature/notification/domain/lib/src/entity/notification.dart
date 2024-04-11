import 'package:core_util/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class ClindNotification with _$ClindNotification {
  const factory ClindNotification({
    @Default('') String id,
    @Default('') String title,
    @Default('') String content,
    @Default('') String route,
    @JsonKey(fromJson: millisToDateTimeDefaultToday) required DateTime createdAt,
    @Default(NotificationType.unknown) NotificationType type,
  }) = _ClindNotification;

  factory ClindNotification.fromJson(Map<String, dynamic> json) => _$ClindNotificationFromJson(json);
}

@JsonEnum()
enum NotificationType {
  @JsonValue('ALARM')
  alarm,
  @JsonValue('NOTICE')
  notice,
  unknown;
}
