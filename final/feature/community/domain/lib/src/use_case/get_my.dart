import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';

class GetMyUseCase implements IUseCase<User, void> {
  final IWriteRepository _writeRepository;

  GetMyUseCase(this._writeRepository);

  @override
  Future<User> execute([void params]) {
    return _writeRepository.getMy();
  }
}