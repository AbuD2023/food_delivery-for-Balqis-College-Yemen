import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.firstName,
    required super.pass,
    required super.email,
    required super.age,
    required super.phoneNumber,
    super.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      pass: json['pass'],
      email: json['email'],
      age: json['age'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'pass': pass,
      'email': email,
      'age': age,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
    };
  }
}
