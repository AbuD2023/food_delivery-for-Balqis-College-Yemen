import 'dart:developer';

import '../../../domain/entities/user_entity.dart';
import '../../models/user_login_dtos_model.dart';
import '../../models/user_sign_in_dtos_model.dart';

abstract class AuthLocalDataSource {
  Future<UserEntity> getUser(dynamic userId);
  Future<UserEntity> signIn(UserSignInDtosModel userSignIn);
  Future<UserEntity> login(UserLoginDtosModel userLogin);
  Future<bool> signOut(dynamic userId);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static final List<UserEntity> _userList = [
    UserEntity(
      id: 1,
      firstName: 'John Doe',
      pass: 'password123',
      email: 'john.doe@example.com',
      age: '25',
      phoneNumber: '1234567890',
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAzBE_P3rPclK8gJnC-y1Mq7kNOvyL8yUHlg&s',
    ),
    UserEntity(
      id: 2,
      firstName: 'AbuD Ali',
      pass: '123456789',
      email: 'abud@example.com',
      age: '30',
      phoneNumber: '0987654321',
      profileImage:
          'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    UserEntity(
      id: 3,
      firstName: 'Ali Ahmed',
      pass: '123456789',
      email: 'ali@example.com',
      age: '28',
      phoneNumber: '1112223333',
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW4AdHQ5lVM_cFZYu4TogVtmEfYH4iHSGwYQ&s',
    ),
  ];

  @override
  Future<UserEntity> getUser(dynamic userId) {
    try {
      final user = _userList.firstWhere(
        (user) => user.id.toString() == userId.toString(),
        orElse: () => throw Exception('User not found with id: $userId'),
      );
      return Future.value(user);
    } catch (e) {
      // إذا لم يتم العثور على المستخدم، أعد مستخدم افتراضي
      return Future.value(
        UserEntity(
          id: userId,
          firstName: 'Guest',
          pass: '',
          email: '',
          age: '',
          phoneNumber: '',
          profileImage: null,
        ),
      );
    }
  }

  @override
  Future<UserEntity> login(UserLoginDtosModel userLogin) {
    try {
      final user = _userList.firstWhere(
        (user) => user.email == userLogin.email && user.pass == userLogin.pass,
        orElse: () => throw Exception('Invalid email or password'),
      );
      log(user.firstName);
      return Future.value(user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signIn(UserSignInDtosModel userSignIn) {
    final newUser = UserEntity(
      id: _userList.length + 1,
      firstName: userSignIn.firstName,
      pass: userSignIn.pass,
      email: userSignIn.email,
      age: userSignIn.age,
      phoneNumber: userSignIn.phoneNumber,
      profileImage: null,
    );
    _userList.add(newUser);
    return Future.value(newUser);
  }

  @override
  Future<bool> signOut(dynamic userId) {
    // ابحث عن العنصر داخل الليست
    final index = _userList.indexWhere(
      (user) => user.id.toString() == userId.toString(),
    );

    // إذا لم يتم العثور على العنصر
    if (index == -1) {
      return Future.value(false);
    }

    // حذف العنصر
    // _userList.removeAt(index);
    return Future.value(true);
  }
}
