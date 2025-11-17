import '../DTOs/user_sign_in_dtos.dart';

class UserSignInDtosModel extends UserSignInDtos {
  UserSignInDtosModel({
    required super.firstName,
    required super.pass,
    required super.email,
    required super.age,
    required super.phoneNumber,
  });

  factory UserSignInDtosModel.fromJson(Map<String, dynamic> json) {
    return UserSignInDtosModel(
      firstName: json['firstName'],
      pass: json['pass'],
      email: json['email'],
      age: json['age'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'pass': pass,
      'email': email,
      'age': age,
      'phoneNumber': phoneNumber,
    };
  }
}
