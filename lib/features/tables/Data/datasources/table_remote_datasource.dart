import 'package:http/http.dart' as http;
import 'package:pos_sys/constants/Error/exceptions.dart';
import 'package:pos_sys/constants/constant.dart';
import 'dart:convert';

import 'package:pos_sys/features/tables/Data/models/table_model.dart';

abstract class TableRemoteDataSource {
  Future<List<TableModel>> getTablesByBranchID(int branchID);
}

class TableRemoteImp implements TableRemoteDataSource {
  final http.Client httpCall;
  TableRemoteImp({required this.httpCall});
  @override
  Future<List<TableModel>> getTablesByBranchID(int branchID) async {
    var response = await httpCall.get(
      Uri.parse('$baseUrl/api/Table/$branchID'),
    );
    if (response.statusCode == 200) {
      List<TableModel> tableList = [];
      final decodedReponse = json.decode(response.body);
      if (decodedReponse['message'] == 'Success') {
        final decodedList = decodedReponse['data'] as List;
        tableList =
            decodedList.map((json) => TableModel.fromJson(json)).toList();
        return tableList;
      } else {
        return Future.error(decodedReponse['message']);
      }
    } else {
      throw ServerException();
    }
  }
}
