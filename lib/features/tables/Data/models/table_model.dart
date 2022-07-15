import 'package:pos_sys/Models/Bills/bills.dart';
import 'package:pos_sys/features/tables/Domain/entity/table_entity.dart';

class TableModel extends Table {
  TableModel(
      {required int branchID,
      required int tableID,
      required int codeID,
      required List<Bills> tableBills,
      required String name})
      : super(
            branchID: branchID,
            tableID: tableID,
            codeID: codeID,
            name: name,
            tableBills: tableBills);

  factory TableModel.fromJson(json) {
    return TableModel(
        branchID: json['branchId'],
        codeID: json['code'],
        name: json['name'],
        tableBills: [],
        tableID: json['tableId']);
  }
}
