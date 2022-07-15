import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widget/display_header.dart';

class PageHeader extends StatelessWidget {
  final Widget widget;
  final String headerTitle;
  const PageHeader({Key? key, required this.widget, required this.headerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DisplayHeader(headerTitle: headerTitle),
        widget,
        Positioned(
          top: 15.h,
          left: 10.w,
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Icon(
                  Icons.chevron_left_outlined,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
