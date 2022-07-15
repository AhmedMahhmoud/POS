import 'package:dartz/dartz.dart';

import '../../../../constants/Error/faliure.dart';
import '../../Data/Model/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> login(String username, String password);
}
