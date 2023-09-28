// ignore_for_file: file_names, non_constant_identifier_names
class UserModel {
  String? email;
  String? password;
  String? access_token;
  String? name;
  String? avatar;
  String? address;
  String? gender;
  int? role;
  String? date;
  String? phone;

  UserModel({
    this.email,
    this.password,
    this.access_token,
    this.name,
    this.avatar,
    this.address,
    this.gender,
    this.role,
    this.date,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'avatar': avatar,
      'gender': gender,
      'name': name,
      'address': address,
      'phone': phone,
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
