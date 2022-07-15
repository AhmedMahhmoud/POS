import 'package:dartz/dartz.dart';
import 'package:pos_sys/constants/Error/faliure.dart';

import '../../Data/models/table_model.dart';

abstract class TableRepository {
  Future<Either<Failure, List<TableModel>>> getTableByBranchID(int branchID);
}
