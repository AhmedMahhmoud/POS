import 'package:flutter/cupertino.dart';
import 'package:pos_sys/constants/constant.dart';
import 'package:pos_sys/features/login/Data/Model/login_model.dart';
import 'package:pos_sys/features/login/Domain/usecases/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  late LoginModel loginModel;
  late String responseMsg;
  bool isLoading = false;
  LoginUsecase loginUsecase;
  LoginProvider(this.loginUsecase);

  Future<void> loginFun(String username, String password) async {
    isLoading = true;
    notifyListeners();
    final faliureOrLogged = await loginUsecase.call(username, password);
    isLoading = false;
    notifyListeners();
    faliureOrLogged.fold((l) {
      responseMsg = mapFailiureToMessage(l);
      // notifyListeners();
    }, (r) {
      loginModel = r;
      responseMsg = SUCCESS_MSG;
      // notifyListeners();
    });
  }
}
