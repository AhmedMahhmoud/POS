import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pos_sys/constants/Error/exceptions.dart';
import 'package:pos_sys/constants/constant.dart';

import '../Model/login_model.dart';

//We will make it as an abstract so we can implement it later with multiple packages
//ex:http,dio ...etc
abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String username, String password);
}

class LoginRemoteImp implements LoginRemoteDataSource {
  final http.Client httpCall;
  LoginRemoteImp({required this.httpCall});
  @override
  Future<LoginModel> login(String username, String password) async {
    var response = await httpCall.post(Uri.parse('$baseUrl/api/User/LogIn'),
        body: json.encode({'username': username, 'password': password}),
        headers: {"Content-Type": 'application/json'});

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      if (decodedResponse['message'] == 'Success') {
        log(decodedResponse.toString());
        LoginModel loginData = LoginModel.fromJson(decodedResponse['data']);
        return loginData;
      } else {
        return Future.error(decodedResponse['message']);
      }
    } else {
      throw ServerException();
    }
  }
}
