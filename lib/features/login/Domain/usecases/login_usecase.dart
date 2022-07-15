import 'package:dartz/dartz.dart';
import 'package:pos_sys/features/login/Domain/repositories/login_repository.dart';

import '../../../../constants/Error/faliure.dart';
import '../../Data/Model/login_model.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase(this.repository);
  Future<Either<Failure, LoginModel>> call(
      String username, String password) async {
    return await repository.login(username, password);
  }
}
