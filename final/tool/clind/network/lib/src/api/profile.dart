import 'package:tool_clind_network/network.dart';

class ProfileApi {
  final ClindRestClient _client;

  const ProfileApi(this._client);

  Future<dynamic> getMy() {
    return _client.get<dynamic>('/profile-api/my').then((value) => value.data);
  }
}
