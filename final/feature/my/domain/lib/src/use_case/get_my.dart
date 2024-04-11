import 'package:core_util/util.dart';
import 'package:my_domain/domain.dart';

class GetMyUseCase implements IUseCase<User, void> {
  final IMyRepository _myRepository;

  GetMyUseCase(this._myRepository);

  @override
  Future<User> execute([void params]) {
    return _myRepository.getMy();
  }
}
