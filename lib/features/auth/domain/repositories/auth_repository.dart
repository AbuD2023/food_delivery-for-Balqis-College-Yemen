import 'package:food_delivery/features/auth/data/models/user_login_dtos_model.dart';
import 'package:food_delivery/features/auth/data/models/user_sign_in_dtos_model.dart';
import 'package:food_delivery/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> getUser(int userId);
  Future<User> signIn(UserSignInDtosModel userSignIn);
  Future<User> login(UserLoginDtosModel userLogin);
  Future<bool> signOut(int userId);
}
