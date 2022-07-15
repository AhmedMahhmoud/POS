import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Colors/color_manager.dart';
import '../constant.dart';

class ServreDownDialog extends StatelessWidget {
  const ServreDownDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorManager.errorLightColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: SizedBox(
        width: 400.w,
        height: 250.h,
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Icon(
            FontAwesomeIcons.exclamationCircle,
            size: setResponsiveFontSize(45),
            color: ColorManager.primaryCol,
          ),
          SizedBox(
            height: 15.h,
          ),
          AutoSizeText(
            'SERVER DOWN',
            style: boldStyle!.copyWith(color: ColorManager.primaryCol),
          ),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            width: 250.w,
            child: AutoSizeText(
              'Server is currently down please try again later .',
              style: boldStyle!.copyWith(
                  color: ColorManager.textCol,
                  fontWeight: FontWeight.w600,
                  fontSize: setResponsiveFontSize(15)),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}
