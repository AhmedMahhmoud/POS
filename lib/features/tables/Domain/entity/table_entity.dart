import 'package:pos_sys/Models/Bills/bills.dart';

class Table {
  final int branchID;
  final int tableID;
  final int codeID;
  final String name;
  final List<Bills> tableBills;

  Table(
      {required this.branchID,
      required this.tableID,
      required this.codeID,
      required this.tableBills,
      required this.name});
}
