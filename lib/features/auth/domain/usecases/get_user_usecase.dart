import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class GetUserUsecase {
  final AuthRepository repository;
  GetUserUsecase(this.repository);
  Future<UserEntity> call(dynamic id) async {
    return await repository.getUser(id);
  }
}
