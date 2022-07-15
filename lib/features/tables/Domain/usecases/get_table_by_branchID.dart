// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:pos_sys/features/tables/Domain/repository/table_repository.dart';

import '../../../../constants/Error/faliure.dart';
import '../../Data/models/table_model.dart';

class GetTablesUsecase {
  final TableRepository tableRepo;
  GetTablesUsecase({required this.tableRepo});
  Future<Either<Failure, List<TableModel>>> call(int branchID) async {
    return await tableRepo.getTableByBranchID(branchID);
  }
}
