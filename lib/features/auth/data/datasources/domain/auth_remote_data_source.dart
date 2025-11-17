import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/constants/api_endpoint.dart';
import '../../../domain/entities/user.dart';
import '../../models/user_login_dtos_model.dart';
import '../../models/user_model.dart';
import '../../models/user_sign_in_dtos_model.dart';

abstract class AuthRemoteDataSource {
  Future<User> getUser(int userId);
  Future<User> signIn(UserSignInDtosModel userSignIn);
  Future<User> login(UserLoginDtosModel userLogin);
  Future<bool> signOut(int userId);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  AuthRemoteDataSourceImpl({
    required this.client,
    this.baseUrl = ApiEndpoint.baseUrl,
  });

  @override
  Future<User> getUser(int userId) async {
    try {
      final response = await client
          .get(Uri.parse('$baseUrl/users'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return UserModel.fromJson(jsonData as Map<String, dynamic>);
      } else {
        throw Exception(
          'Failed to load user profile. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<User> login(UserLoginDtosModel userLogin) async {
    try {
      final response = await client
          .post(
            Uri.parse('$baseUrl/user/login'),
            headers: {'Content-Type': 'application/json'},
            body: userLogin.toJson(),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to Login. Status code: ${response.statusCode}');
      } else {
        final jsonData = json.decode(response.body);
        return UserModel.fromJson(jsonData as Map<String, dynamic>);
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<User> signIn(UserSignInDtosModel userSignIn) async {
    try {
      final response = await client
          .post(
            Uri.parse('$baseUrl/user/signin'),
            headers: {'Content-Type': 'application/json'},
            body: userSignIn.toJson(),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to add to cart: ${response.statusCode}');
      } else {
        final jsonData = json.decode(response.body);
        return UserModel.fromJson(jsonData as Map<String, dynamic>);
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<bool> signOut(int userId) async {
    try {
      final response = await client
          .post(
            Uri.parse('$baseUrl/user/signin'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'userId': userId}),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to add to cart: ${response.statusCode}');
      } else {
        return true;
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
