import 'dart:ffi';

class Bills {
  DateTime billDate;
  Double billTotal;
  Double billSubTotal;
  String vat;
  bool isPaid;
  int id;
  int tableID;
  String createdByUserId;
  Bills({
    required this.billDate,
    required this.billTotal,
    required this.billSubTotal,
    required this.vat,
    required this.id,
    required this.isPaid,
    required this.tableID,
    required this.createdByUserId,
  });
}
