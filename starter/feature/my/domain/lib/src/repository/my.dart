import 'package:my_domain/domain.dart';

abstract class IMyRepository {
  Future<User> getMy();
}
