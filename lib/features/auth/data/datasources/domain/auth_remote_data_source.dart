import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/constants/api_endpoint.dart';
import '../../../domain/entities/user_entity.dart';
import '../../models/user_login_dtos_model.dart';
import '../../models/user_model.dart';
import '../../models/user_sign_in_dtos_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> getUser();
  Future<UserEntity> signIn(UserSignInDtosModel userSignIn);
  Future<UserEntity> login(UserLoginDtosModel userLogin);
  Future<fAuth.UserCredential> signInWithEmail();
  Future<bool> signOut(dynamic userId);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  AuthRemoteDataSourceImpl({
    required this.client,
    this.baseUrl = ApiEndpoint.baseUrl,
  });

  @override
  Future<UserEntity> getUser() async {
    try {
      // Prefer the currently signed-in Firebase user if available
      final fAuth.User? current = fAuth.FirebaseAuth.instance.currentUser;
      UserModel? userData;

      if (current != null) {
        // Use the currentUser fields first, fall back to providerData if needed
        final providerProfile = current.providerData.isNotEmpty
            ? current.providerData.first
            : null;
        final name = current.displayName ?? providerProfile?.displayName ?? '';
        final emailAddress = current.email ?? providerProfile?.email ?? '';
        final profilePhoto =
            current.photoURL ?? providerProfile?.photoURL ?? '';
        final phoneNum = current.phoneNumber ?? '';
        final provider = providerProfile?.providerId ?? 'firebase';
        final uid = current.uid;

        userData = UserModel(
          id: uid,
          firstName: name.toString(),
          pass: '**************',
          email: emailAddress.toString(),
          age: provider,
          phoneNumber: phoneNum,
          profileImage: profilePhoto,
        );
        return userData;
      }

      // If there's no current user, wait for the next auth event (if any)
      final fAuth.User? next = await fAuth.FirebaseAuth.instance
          .authStateChanges()
          .first;
      if (next != null) {
        final providerProfile = next.providerData.isNotEmpty
            ? next.providerData.first
            : null;
        final name = next.displayName ?? providerProfile?.displayName ?? '';
        final emailAddress = next.email ?? providerProfile?.email ?? '';
        final profilePhoto = next.photoURL ?? providerProfile?.photoURL ?? '';
        final phoneNum = next.phoneNumber ?? '';
        final provider = providerProfile?.providerId ?? 'firebase';
        final uid = next.uid;

        userData = UserModel(
          id: uid,
          firstName: name.toString(),
          pass: '**************',
          email: emailAddress.toString(),
          age: provider,
          phoneNumber: phoneNum,
          profileImage: profilePhoto,
        );
        return userData;
      }

      throw Exception(
        'Failed to load user profile. From Firebase: no current user',
      );
    } catch (e) {
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
  }

  @override
  Future<UserEntity> login(UserLoginDtosModel userLogin) async {
    try {
      final credential = await fAuth.FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: userLogin.email,
            password: userLogin.pass,
          );
      //-----------------------
      UserModel? userData;
      if (credential.user != null) {
        for (final providerProfile in credential.user!.providerData) {
          // ID of the provider (google.com, apple.com, etc.)
          final provider = providerProfile.providerId;

          // UID specific to the provider
          final uid = providerProfile.uid;

          // Name, email address, and profile photo URL
          final name = providerProfile.displayName;
          final emailAddress = providerProfile.email;
          final profilePhoto = providerProfile.photoURL;
          final phoneNum = providerProfile.phoneNumber ?? '';
          userData = UserModel(
            id: uid,
            firstName: name.toString(),
            pass: '**************',
            email: emailAddress.toString(),
            age: provider,
            phoneNumber: phoneNum,
            profileImage: profilePhoto,
          );
        }
      }

      if (userData != null) {
        return userData;
      } else {
        throw Exception('Failed to load user profile. Data is Null');
      }
      //-----------------------
    } on fAuth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else {
        throw Exception('Error Login To Firebase :(');
      }
    } catch (e) {
      try {
        final response = await client
            .post(
              Uri.parse('$baseUrl/user/login'),
              headers: {'Content-Type': 'application/json'},
              body: userLogin.toJson(),
            )
            .timeout(const Duration(seconds: 10));

        if (response.statusCode != 200 && response.statusCode != 201) {
          throw Exception(
            'Failed to Login. Status code: ${response.statusCode}',
          );
        } else {
          final jsonData = json.decode(response.body);
          return UserModel.fromJson(jsonData as Map<String, dynamic>);
        }
      } catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }

  @override
  Future<UserEntity> signIn(UserSignInDtosModel userSignIn) async {
    try {
      final credential = await fAuth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: userSignIn.email,
            password: userSignIn.pass,
          );

      //-----------------------
      UserModel? userData;
      if (credential.user != null) {
        for (final providerProfile in credential.user!.providerData) {
          // ID of the provider (google.com, apple.com, etc.)
          final provider = providerProfile.providerId;

          // UID specific to the provider
          final uid = providerProfile.uid;

          // Name, email address, and profile photo URL
          final name = providerProfile.displayName;
          final emailAddress = providerProfile.email;
          final profilePhoto = providerProfile.photoURL;
          final phoneNum = providerProfile.phoneNumber ?? '';
          userData = UserModel(
            id: uid,
            firstName: name.toString(),
            pass: '**************',
            email: emailAddress.toString(),
            age: provider,
            phoneNumber: phoneNum,
            profileImage: profilePhoto,
          );
        }
      }

      if (userData != null) {
        return userData;
      } else {
        throw Exception('Failed to load user profile. Data is Null');
      }
      //-----------------------
    } on fAuth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception('Error SignIn To Firebase :(');
      }
    } catch (e) {
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
  }

  @override
  Future<fAuth.UserCredential> signInWithEmail() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();
      // googleUser!.clearAuthCache();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential
      final credential = fAuth.GoogleAuthProvider.credential(
        // accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await fAuth.FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception('Error to sign in with google: $e');
    }
  }

  @override
  Future<bool> signOut(dynamic userId) async {
    try {
      await fAuth.FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      try {
        final response = await client
            .post(
              Uri.parse('$baseUrl/user/signin'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode({'userId': userId}),
            )
            .timeout(const Duration(seconds: 10));

        if (response.statusCode != 200 && response.statusCode != 201) {
          throw Exception('Failed to SingOut: ${response.statusCode}');
        } else {
          return true;
        }
      } catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }
}
