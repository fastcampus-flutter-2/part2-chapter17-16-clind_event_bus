import 'package:tool_clind_network/network.dart';

abstract class IProfileRemoteDataSource {
  Future<dynamic> getMy();
}

class ProfileRemoteDataSource implements IProfileRemoteDataSource {
  final ProfileApi _api;

  ProfileRemoteDataSource(this._api);

  @override
  Future<dynamic> getMy() {
    return _api.getMy();
  }
}
