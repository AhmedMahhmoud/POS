import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Colors/color_manager.dart';
import '../constant.dart';

class FaliureDialog extends StatelessWidget {
  final String faliureMsg;
  const FaliureDialog({Key? key, required this.faliureMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorManager.errorLightColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: SizedBox(
        width: 400.w,
        height: 250.h,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(
            FontAwesomeIcons.exclamationCircle,
            size: setResponsiveFontSize(45),
            color: ColorManager.primaryCol,
          ),
          AutoSizeText(
            faliureMsg,
            style: boldStyle!.copyWith(color: ColorManager.primaryCol),
          ),
        ]),
      ),
    );
  }
}
