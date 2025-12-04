import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:food_delivery/features/auth/data/models/user_login_dtos_model.dart';
import 'package:food_delivery/features/auth/data/models/user_sign_in_dtos_model.dart';
import 'package:food_delivery/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity> getUser(int userId);
  Future<UserEntity> signIn(UserSignInDtosModel userSignIn);
  Future<UserEntity> login(UserLoginDtosModel userLogin);
  Future<fAuth.UserCredential> signWithEmail();
  Future<bool> signOut(int userId);
}
