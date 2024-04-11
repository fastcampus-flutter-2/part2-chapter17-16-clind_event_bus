import 'package:data/data.dart';
import 'package:domain/domain.dart';

class FirebaseRepository implements IFirebaseRepository {
  final FirebaseDataSource _firebaseDataSource;

  FirebaseRepository(this._firebaseDataSource);

  @override
  Future<String> getAdImage() {
    return _firebaseDataSource.getAdImage();
  }
}
