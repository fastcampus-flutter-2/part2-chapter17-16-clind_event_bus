import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class GetPopularChannelsUseCase implements IUseCase<List<Channel>, void> {
  final ICommunityRepository _communityRepository;

  GetPopularChannelsUseCase(this._communityRepository);

  @override
  Future<List<Channel>> execute([void params]) {
    return _communityRepository.getPopularChannels();
  }
}