import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_sys/Colors/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pos_sys/Views/CategoriesItems/categories_items.dart';
import 'package:pos_sys/constants/constant.dart';
import 'package:provider/provider.dart';

import '../../../../constants/Shared/Header/page_header.dart';
import '../../../Providers/CategoryProv/category.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        backgroundColor: ColorManager.backgroundCol,
        body: PageHeader(
          headerTitle: 'اختر الصنف',
          widget: Positioned(
            top: 90.h,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: GridView.builder(
                  itemCount: catList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<CategoryProv>(context, listen: false)
                            .setCurrentItem(catList[index].catID);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoriesItems(),
                            ));
                      },
                      child: SlideInLeft(
                        delay: Duration(milliseconds: 100 * index),
                        child: Card(
                            elevation: 2,
                            child: SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 120.h,
                                    child: Image.network(
                                      catList[index].photo,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Center(
                                      child: AutoSizeText(
                                    catList[index].arName.toString(),
                                    style: boldStyle!.copyWith(
                                        color: Colors.black,
                                        fontSize: setResponsiveFontSize(17)),
                                    textAlign: TextAlign.center,
                                  )),
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10.h,
                      childAspectRatio: 1,
                      mainAxisExtent: 190.h,
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.h),
                ),
              ),
            ),
          ),
        ));
  }
}
