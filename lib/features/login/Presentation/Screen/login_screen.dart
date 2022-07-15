import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_sys/Colors/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_sys/constants/Dialogs/normal_faliure_dialog.dart';
import 'package:pos_sys/constants/Error/faliure.dart';
import 'package:pos_sys/constants/LottiePaths/lottie_paths.dart';
import 'package:pos_sys/constants/constant.dart';
import 'package:pos_sys/features/login/Presentation/Provider/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/Shared/Buttons/rounded_button.dart';
import '../../../branches/Presentation/Screen/branches_screen.dart';
import '../Widgets/login_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var loginProv = Provider.of<LoginProvider>(context, listen: false);
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorManager.backgroundCol,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 400.h,
                    child: Lottie.asset(
                      LottiePath.dashboard,
                    ),
                  ),
                  ZoomIn(
                    child: AutoSizeText(
                      'تسجيل الدخول',
                      style: boldStyle!.copyWith(
                          color: Colors.black,
                          fontSize: setResponsiveFontSize(20)),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  LoginButton(
                    inputController: _usernameController,
                    labelTitle: "اسم المستخدم",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  LoginButton(
                    inputController: _passwordController,
                    labelTitle: "كلمة السر",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SlideInUp(
                    delay: const Duration(milliseconds: 1200),
                    child: Provider.of<LoginProvider>(context).isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : RoundedButton(
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              } else {
                                await loginProv.loginFun(
                                    _usernameController.text,
                                    _passwordController.text);

                                if (loginProv.responseMsg == SUCCESS_MSG) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BranchePage(),
                                      ));
                                } else {
                                  log("res msg : ${loginProv.responseMsg}");
                                  if (loginProv.responseMsg ==
                                          SERVER_FAILURE_MESSAGE ||
                                      loginProv.responseMsg ==
                                          OFFLINE_FAILURE_MESSAGE) {
                                    displayErrorDialog(
                                        context, loginProv.responseMsg);
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            ZoomIn(
                                                child: FaliureDialog(
                                              faliureMsg: loginProv.responseMsg,
                                            )));
                                  }
                                }
                              }
                            },
                            text: 'تسجيل',
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
