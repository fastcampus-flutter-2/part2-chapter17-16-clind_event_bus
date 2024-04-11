import 'package:core_util/util.dart';

abstract class IFirebaseRemoteDataSource {
  Future<String> getString(String key);
}

class FirebaseRemoteDataSource implements IFirebaseRemoteDataSource {
  @override
  Future<String> getString(String key) async {
    return ICoreFirebaseRemoteConfig.getString(key);
  }
}
