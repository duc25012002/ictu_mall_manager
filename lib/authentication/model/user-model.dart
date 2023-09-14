// ignore_for_file: file_names

class UserModel {
  String? email;
  String? password;

  UserModel({this.email, this.password});
  
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
