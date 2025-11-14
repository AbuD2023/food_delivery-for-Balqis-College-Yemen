import 'package:http/http.dart' as http;

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final http.Client client;

  AuthRepositoryImpl({required this.client});
  @override
  Future<User> signIn(User user) async {
    return await Future.delayed(
      Duration(seconds: 5),
      () => User(firstName: 'Ali', pass: 'kjakjd@#@#(!@*n,asd)'),
    );
  }
}
