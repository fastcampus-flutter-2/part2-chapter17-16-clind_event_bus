import 'package:my_data/data.dart';

class MyDataSource {
  final IProfileRemoteDataSource _profileRemoteDataSource;

  MyDataSource(this._profileRemoteDataSource);

  Future<dynamic> getMy() {
    return _profileRemoteDataSource.getMy();
  }
}
