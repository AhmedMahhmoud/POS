import 'package:flutter/material.dart';
import 'package:pos_sys/Colors/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pos_sys/constants/constant.dart';

class DisplayHeader extends StatelessWidget {
  final String headerTitle;
  const DisplayHeader({
    required this.headerTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20.h),
            width: double.infinity,
            height: 150.h,
            color: ColorManager.primaryCol,
            child: Center(
                child: AutoSizeText(
              headerTitle,
              style: boldStyle!.copyWith(fontSize: setResponsiveFontSize(20)),
            )),
          ),
        ],
      ),
    );
  }
}
