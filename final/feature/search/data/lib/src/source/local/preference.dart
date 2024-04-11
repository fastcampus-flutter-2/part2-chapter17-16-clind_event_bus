import 'package:core_storage/storage.dart';

abstract class IPreferenceLocalDataSource {
  Future<bool> setString(String key, String value);

  Future<String> getString(String key, {String defaultValue});
}

class PreferenceLocalDataSource implements IPreferenceLocalDataSource {
  const PreferenceLocalDataSource();

  @override
  Future<bool> setString(String key, String value) {
    return ISharedPreference.setString(key, value);
  }

  @override
  Future<String> getString(String key, {String defaultValue = ''}) {
    return ISharedPreference.getString(key, defaultValue: defaultValue);
  }
}
