import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_sys/Colors/color_manager.dart';

import '../../../../constants/constant.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController inputController;
  final String labelTitle;
  const LoginButton(
      {Key? key, required this.inputController, required this.labelTitle})
      : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool validationError = false;
  var _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.black;
    const accentColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return SlideInUp(
      delay: const Duration(seconds: 1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: validationError ? 80.h : 50.h,
        width: 300.w,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextFormField(
          obscureText:
              widget.labelTitle == 'اسم المستخدم' ? false : _passwordVisible,
          textInputAction: TextInputAction.next,
          cursorColor: ColorManager.primaryCol,
          controller: widget.inputController,
          validator: (value) {
            if (value.toString().isEmpty) {
              setState(() {
                validationError = true;
              });
              return "مطلوب";
            } else if (value!.length < 4) {
              setState(() {
                validationError = true;
              });
              return "${widget.labelTitle}  يجب ان تزيد عن 4 حروف";
            } else {
              setState(() {
                validationError = false;
              });
            }
            return null;
          },
          onChanged: (value) {
            //Do something wi
          },
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
              fontSize: setResponsiveFontSize(14),
              color: Colors.black,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            labelText: widget.labelTitle,

            suffixIcon: InkWell(
              onTap: () {
                if (widget.labelTitle != 'اسم المستخدم') {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                }
              },
              child: Icon(
                widget.labelTitle == 'اسم المستخدم'
                    ? Icons.person
                    : Icons.visibility_sharp,
                color: ColorManager.primaryCol,
              ),
            ),
            labelStyle: const TextStyle(color: primaryColor),
            // prefixIcon: Icon(Icons.email),
            filled: true, errorMaxLines: 2,
            errorStyle: const TextStyle(),
            fillColor: accentColor,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(.75),
                fontWeight: FontWeight.w600),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0.h),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primaryCol, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),

            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
    );
  }
}
