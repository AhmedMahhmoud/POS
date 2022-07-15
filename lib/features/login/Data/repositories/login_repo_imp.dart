import 'dart:developer';

import 'package:pos_sys/constants/Error/exceptions.dart';
import 'package:pos_sys/constants/network/network_info.dart';
import 'package:pos_sys/features/login/Data/Model/login_model.dart';
import 'package:pos_sys/constants/Error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:pos_sys/features/login/Domain/repositories/login_repository.dart';

import '../datasources/login_remote_datasource.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  LoginRepositoryImp(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, LoginModel>> login(
      String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.login(username, password));
      } on ServerException {
        //Server exception is throw inside the data source
        return Left(ServerFailure());
      } catch (e) {
        log(e.toString());
        return Left(FailResponse(e.toString()));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
