import 'package:equatable/equatable.dart';

class Login extends Equatable {
  // final String userId;
  final String userName;
  final String userRole;
  final String token;
  const Login({
    // required this.userId,
    required this.userName,
    required this.userRole,
    required this.token,
  });

  @override
  List<Object> get props => [userName, userRole, token];
}
