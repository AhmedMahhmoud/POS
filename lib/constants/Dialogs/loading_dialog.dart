import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_sys/constants/LottiePaths/lottie_paths.dart';

import '../../Colors/color_manager.dart';
import '../constant.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: SizedBox(
        width: 300.w,
        height: 150.h,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            child: Lottie.asset(
              LottiePath.loading,
            ),
            width: 70.w,
            height: 70.h,
          ),
          AutoSizeText(
            "برجاء الأنتظار",
            style: boldStyle!.copyWith(color: ColorManager.textCol),
          ),
        ]),
      ),
    );
  }
}
