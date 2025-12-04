import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmailUsecase {
  final AuthRepository repository;
  SignInWithEmailUsecase(this.repository);
  Future<UserCredential> call() async {
    return await repository.signWithEmail();
  }
}
