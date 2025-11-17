import '../../../domain/entities/user.dart';
import '../../models/user_login_dtos_model.dart';
import '../../models/user_sign_in_dtos_model.dart';

abstract class AuthLocalDataSource {
  Future<User> getUser(int userId);
  Future<User> signIn(UserSignInDtosModel userSignIn);
  Future<User> login(UserLoginDtosModel userLogin);
  Future<bool> signOut(int userId);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static final List<User> _userList = [
    User(
      id: 1,
      firstName: 'John Doe',
      pass: 'password123',
      email: 'john.doe@example.com',
      age: '25',
      phoneNumber: '1234567890',
    ),
    User(
      id: 2,
      firstName: 'AbuD Ali',
      pass: '123456789',
      email: 'abud@example.com',
      age: '30',
      phoneNumber: '0987654321',
    ),
    User(
      id: 3,
      firstName: 'Ali Ahmed',
      pass: '123456789',
      email: 'ali@example.com',
      age: '28',
      phoneNumber: '1112223333',
    ),
  ];

  @override
  Future<User> getUser(int userId) {
    return _userList
        .where((user) => user.id == userId)
        .map((user) => Future.value(user))
        .first;
  }

  @override
  Future<User> login(UserLoginDtosModel userLogin) {
    return _userList
        .where(
          (user) =>
              user.email == userLogin.email && user.pass == userLogin.pass,
        )
        .map((user) => Future.value(user))
        .first;
  }

  @override
  Future<User> signIn(UserSignInDtosModel userSignIn) {
    final newUser = User(
      id: _userList.length + 1,
      firstName: userSignIn.firstName,
      pass: userSignIn.pass,
      email: userSignIn.email,
      age: userSignIn.age,
      phoneNumber: userSignIn.phoneNumber,
    );
    _userList.add(newUser);
    return Future.value(newUser);
  }

  @override
  Future<bool> signOut(int userId) {
    // ابحث عن العنصر داخل الليست
    final index = _userList.indexWhere((user) => user.id == userId);

    // إذا لم يتم العثور على العنصر
    if (index == -1) {
      return Future.value(false);
    }

    // حذف العنصر
    _userList.removeAt(index);
    return Future.value(true);
  }
}
