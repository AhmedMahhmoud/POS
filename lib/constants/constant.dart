import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_sys/constants/Dialogs/server_down_dialog.dart';
import 'package:pos_sys/constants/Error/faliure.dart';

import '../Models/Category/Category.dart';
import 'Dialogs/loading_dialog.dart';
import 'Dialogs/offline_connection_dialog.dart';

setResponsiveFontSize(size) {
  return ScreenUtil().setSp(size);
}

const String SUCCESS_MSG = 'SUCCESS';
const String baseUrl = 'http://ehablotfy22-001-site1.dtempurl.com';
TextStyle? boldStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: setResponsiveFontSize(16),
    color: Colors.white);

dynamic displayErrorDialog(BuildContext context, String errorMSG) {
  showDialog(
      context: context,
      builder: (BuildContext context) => ZoomIn(
            child: errorMSG == OFFLINE_FAILURE_MESSAGE
                ? const OfflineConnectionDialog()
                : const ServreDownDialog(),
          ));
}

String mapFailiureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    case FailResponse:
      return failure.props.first.toString();
    default:
      return SERVER_FAILURE_MESSAGE;
  }
}

dynamic displayLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: ((context) {
        return const LoadingDialog();
      }));
}

List<Category> catList = [
  Category(
    name: 'Playstation',
    catID: 1,
    arName: 'بلايستيشن',
    photo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRKAcw28MXlz9pQHAMKmar2SMHYO9BJIcH68G9RPrVpyJb939Bk4UPZXR3cIvrY1Pt36w&usqp=CAU',
    isVisible: true,
  ),
  Category(
    name: 'Playstation',
    arName: 'مشروبات',
    catID: 2,
    photo:
        'https://www.acouplecooks.com/wp-content/uploads/2021/06/Strawberry-Water-006.jpg',
    isVisible: true,
  ),
  Category(
    name: 'Playstation',
    arName: 'سندوتشات',
    catID: 3,
    photo:
        'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/6944451c-d165-4a8c-920c-b2282cd5174c.jpg',
    isVisible: true,
  ),
  Category(
    name: 'Playstation',
    arName: 'مكرونات',
    catID: 4,
    photo:
        'https://shamlola.s3.amazonaws.com/Shamlola_Images/9/src/32f8245f887ba4d701a8c5b7ceb914eb0047c5e6.jpg',
    isVisible: true,
  ),
  Category(
    name: 'Playstation',
    arName: 'حلويات',
    catID: 5,
    photo:
        'https://insanelygoodrecipes.com/wp-content/uploads/2020/08/Birthday-Dessert-Ideas-Red-Velvet-Cake.png',
    isVisible: true,
  ),
  Category(
    name: 'Snacks',
    catID: 6,
    arName: 'سناكس',
    photo:
        'https://d2tm09s6lgn3z4.cloudfront.net/2021/01/1540394378_600_155342_maxresdefault1.jpg',
    isVisible: true,
  ),
];
