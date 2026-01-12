import 'package:firebase_auth/firebase_auth.dart' as fauth;
import 'package:food_delivery/features/auth/data/models/user_login_dtos_model.dart';
import 'package:food_delivery/features/auth/data/models/user_sign_in_dtos_model.dart';
import 'package:food_delivery/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> getUser(dynamic userId);
  Future<UserEntity> signIn(UserSignInDtosModel userSignIn);
  Future<UserEntity> login(UserLoginDtosModel userLogin);
  Future<fauth.UserCredential> signWithEmail();
  Future<bool> signOut(dynamic userId);
}
