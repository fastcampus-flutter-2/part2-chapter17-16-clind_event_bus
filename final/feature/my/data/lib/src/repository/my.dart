import 'package:my_data/data.dart';
import 'package:my_domain/domain.dart';

class MyRepository implements IMyRepository {
  final MyDataSource _myDataSource;

  MyRepository(this._myDataSource);

  @override
  Future<User> getMy() async {
    final dynamic json = await _myDataSource.getMy();
    return User.fromJson(json);
  }
}
