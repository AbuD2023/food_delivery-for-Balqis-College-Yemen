import 'package:food_delivery/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> signIn(User user);
}
