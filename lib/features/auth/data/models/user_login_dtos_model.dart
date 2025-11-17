import '../DTOs/user_login_dtos.dart';

class UserLoginDtosModel extends UserLoginDtos {
  UserLoginDtosModel({required super.pass, required super.email});

  factory UserLoginDtosModel.fromJson(Map<String, dynamic> json) {
    return UserLoginDtosModel(pass: json['pass'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'pass': pass, 'email': email};
  }
}
