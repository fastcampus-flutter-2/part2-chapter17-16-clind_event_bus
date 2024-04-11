import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class GetChannelsUseCase implements IUseCase<List<Channel>, void> {
  final ICommunityRepository _communityRepository;

  GetChannelsUseCase(this._communityRepository);

  @override
  Future<List<Channel>> execute([void params]) {
    return _communityRepository.getChannels();
  }
}
