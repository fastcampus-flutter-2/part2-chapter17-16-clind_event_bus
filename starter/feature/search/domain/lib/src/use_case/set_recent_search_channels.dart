import 'package:core_util/util.dart';
import 'package:search_domain/domain.dart';

class SetRecentSearchChannelsUseCase implements IUseCase<bool, SetRecentSearchChannelsParams> {
  final ISearchRepository _searchRepository;

  SetRecentSearchChannelsUseCase(this._searchRepository);

  @override
  Future<bool> execute([SetRecentSearchChannelsParams? params]) async {
    if (params == null) return false;
    return _searchRepository.setRecentSearchChannels(
      channelList: params.channelList,
    );
  }
}

class SetRecentSearchChannelsParams {
  final List<Channel> channelList;

  SetRecentSearchChannelsParams({
    required this.channelList,
  });
}
