import 'package:pos_sys/features/login/Domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel(
      {required String userName,
      required String userRole,
      required String token})
      : super(userName: userName, userRole: userRole, token: token);
  factory LoginModel.fromJson(json) {
    return LoginModel(
        token: json['token'], userName: json['user'], userRole: json['roles']);
  }
  toJson() {
    return {'token': token};
  }
}
