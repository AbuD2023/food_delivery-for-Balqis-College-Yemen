class UserEntity {
  final dynamic id;
  final String firstName;
  final String pass;
  final String email;
  final String age;
  final String phoneNumber;
  final String? profileImage;
  UserEntity({
    required this.id,
    required this.firstName,
    required this.pass,
    required this.email,
    required this.age,
    required this.phoneNumber,
    this.profileImage,
  });
}
