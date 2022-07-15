import 'package:flutter/cupertino.dart';
import 'package:pos_sys/constants/constant.dart';
import 'package:pos_sys/features/tables/Data/models/table_model.dart';
import 'package:pos_sys/features/tables/Domain/usecases/get_table_by_branchID.dart';

class TableProvider extends ChangeNotifier {
  final GetTablesUsecase getTablesUsecase;
  TableProvider({required this.getTablesUsecase});
  late List<TableModel> tablesList = [];
  late String responseMsg;
  Future<void> getTablesByBranchID(int branchID) async {
    final completedOrFailed =
        await getTablesUsecase.tableRepo.getTableByBranchID(branchID);
    completedOrFailed.fold((l) {
      responseMsg = mapFailiureToMessage(l);
    }, (r) {
      tablesList = r;
      responseMsg = SUCCESS_MSG;
    });
  }
}
