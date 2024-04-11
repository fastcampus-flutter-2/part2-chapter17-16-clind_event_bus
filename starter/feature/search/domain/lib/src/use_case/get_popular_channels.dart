import 'package:core_util/util.dart';
import 'package:search_domain/domain.dart';

class GetPopularChannelsUseCase implements IUseCase<List<Channel>, void> {
  final ISearchRepository _searchRepository;

  GetPopularChannelsUseCase(this._searchRepository);

  @override
  Future<List<Channel>> execute([void params]) {
    return _searchRepository.getPopularChannels();
  }
}
