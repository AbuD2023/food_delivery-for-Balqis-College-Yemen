import '../repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository repository;
  SignOutUsecase(this.repository);
  Future<bool> call(int id) async {
    return await repository.signOut(id);
  }
}
