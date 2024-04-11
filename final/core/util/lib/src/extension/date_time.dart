extension DateTimeExtension on DateTime {
  String toTimeAgo() {
    final DateTime now = DateTime.now();

    final int diffMinutes = now.difference(this).inMinutes;
    if (diffMinutes < 2) {
      return '방금';
    }

    if (diffMinutes < 60) {
      return '$diffMinutes분';
    }

    final int diffHours = now.difference(this).inHours;
    if (diffHours < 24) {
      return '$diffHours시간';
    }

    final int diffDays = now.difference(this).inDays;
    if (diffDays < 2) {
      return '어제';
    }

    if (diffDays < 30) {
      return '$diffDays일';
    }

    return '${(diffDays / 30).ceil()}개월';
  }
}
