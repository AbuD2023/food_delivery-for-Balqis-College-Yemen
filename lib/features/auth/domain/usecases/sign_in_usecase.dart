import 'package:food_delivery/features/auth/domain/entities/user.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository repository;
  SignInUsecase(this.repository);
  Future<User> call(User user) async {
    return await repository.signIn(user);
  }
}
