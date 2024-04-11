DateTime millisToDateTimeDefaultToday(int? value) {
  return millisToDateTime(value) ?? DateTime.now();
}

DateTime? millisToDateTime(int? value) {
  if (value == null || value == 0) return null;
  return DateTime.fromMillisecondsSinceEpoch(value);
}