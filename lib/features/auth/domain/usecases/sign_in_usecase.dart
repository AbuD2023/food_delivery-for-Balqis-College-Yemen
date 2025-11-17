import 'package:food_delivery/features/auth/data/models/user_sign_in_dtos_model.dart';
import 'package:food_delivery/features/auth/domain/entities/user.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository repository;
  SignInUsecase(this.repository);
  Future<User> call(UserSignInDtosModel userSignIn) async {
    return await repository.signIn(userSignIn);
  }
}
