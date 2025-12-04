import '../repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository repository;
  SignOutUsecase(this.repository);
  Future<bool> call(dynamic id) async {
    return await repository.signOut(id);
  }
}
