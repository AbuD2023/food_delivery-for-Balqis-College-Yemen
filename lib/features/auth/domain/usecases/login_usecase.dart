import 'package:food_delivery/features/auth/data/models/user_login_dtos_model.dart';
import 'package:food_delivery/features/auth/domain/entities/user.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);
  Future<UserEntity> call(UserLoginDtosModel userLogin) async {
    return await repository.login(userLogin);
  }
}
