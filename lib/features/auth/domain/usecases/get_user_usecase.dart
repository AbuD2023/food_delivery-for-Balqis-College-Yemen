import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetUserUsecase {
  final AuthRepository repository;
  GetUserUsecase(this.repository);
  Future<User> call(int id) async {
    return await repository.getUser(id);
  }
}
