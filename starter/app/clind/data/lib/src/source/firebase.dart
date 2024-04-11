import 'package:data/data.dart';

class FirebaseDataSource {
  final IFirebaseRemoteDataSource _firebaseRemoteDataSource;

  FirebaseDataSource(this._firebaseRemoteDataSource);

  Future<String> getAdImage() {
    return _firebaseRemoteDataSource.getString('ad_image');
  }
}
