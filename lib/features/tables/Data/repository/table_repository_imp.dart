import 'dart:developer';

import 'package:pos_sys/constants/Error/exceptions.dart';
import 'package:pos_sys/constants/network/network_info.dart';
import 'package:pos_sys/features/tables/Data/datasources/table_remote_datasource.dart';
import 'package:pos_sys/features/tables/Data/models/table_model.dart';
import 'package:pos_sys/constants/Error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:pos_sys/features/tables/Domain/repository/table_repository.dart';

class TableRepositoryImp implements TableRepository {
  final NetworkInfo networkInfo;
  final TableRemoteDataSource remoteDataSource;
  TableRepositoryImp(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<TableModel>>> getTableByBranchID(
      int branchID) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getTablesByBranchID(branchID));
      } on ServerException {
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
