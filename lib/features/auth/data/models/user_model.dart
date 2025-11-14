import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.firstName, required super.pass});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(firstName: json['firstName'], pass: json['pass']);
  }

  Map<String, dynamic> toJson() {
    return {'firstName': firstName, 'pass': pass};
  }
}
