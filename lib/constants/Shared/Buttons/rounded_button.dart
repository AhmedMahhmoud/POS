import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pos_sys/Colors/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const RoundedButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xffffffff);

    const double borderRadius = 5;

    return SizedBox(
      width: 250.w,
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                  colors: [ColorManager.primaryCol, Colors.red.shade800])),
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(EdgeInsets.only(
                    right: 75.w, left: 75.w, top: 15.h, bottom: 15.h)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                )),
            onPressed: onPressed,
            child: AutoSizeText(text,
                style: TextStyle(
                    color: accentColor,
                    fontSize: setResponsiveFontSize(16),
                    fontWeight: FontWeight.w700)),
          )),
    );
  }
}
