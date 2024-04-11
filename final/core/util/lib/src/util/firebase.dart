import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

abstract class ICoreFirebase {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }
}

abstract class ICoreFirebaseRemoteConfig {
  static Future<void> initialize() async {
    final RemoteConfigSettings settings = RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    );
    await FirebaseRemoteConfig.instance.setConfigSettings(settings);
  }

  static Future<bool> fetchAndActivate() async {
    try {
      await FirebaseRemoteConfig.instance.fetchAndActivate();
      return true;
    } catch (ignore) {
      return false;
    }
  }

  static String getString(String key) {
    final Map<String, RemoteConfigValue> data = FirebaseRemoteConfig.instance.getAll();
    if (data.containsKey(key)) {
      return FirebaseRemoteConfig.instance.getString(key);
    }
    return '';
  }
}
