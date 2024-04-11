abstract class IUseCase<T, Params> {
  Future<T> execute([Params params]);
}