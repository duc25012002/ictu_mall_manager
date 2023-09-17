// ignore_for_file: file_names, non_constant_identifier_names

class UserModel {
  String? email;
  String? password;
  String? access_token;

  UserModel({this.email, this.password, this.access_token});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      access_token: json['access_token'],
    );
  }
}
