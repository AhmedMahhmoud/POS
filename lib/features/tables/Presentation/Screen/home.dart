import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_sys/Colors/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pos_sys/constants/ImagePaths/image_paths.dart';
import 'package:pos_sys/constants/constant.dart';

import '../../../../Views/CategoriesPage/Views/categories.dart';
import '../../../../constants/Shared/Header/page_header.dart';
import '../../Data/models/table_model.dart';

class TablePage extends StatelessWidget {
  final List<TableModel> tableList;
  const TablePage({required this.tableList});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        backgroundColor: ColorManager.backgroundCol,
        body: PageHeader(
          headerTitle: 'اختر الطاولة',
          widget: Positioned(
            top: 90.h,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: GridView.builder(
                  itemCount: tableList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoriesPage(),
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
                                    height: 90.h,
                                    child: Image.asset(
                                      ImagePaths.table,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Center(
                                      child: AutoSizeText(
                                    tableList[index].name.toString(),
                                    style: boldStyle!
                                        .copyWith(color: Colors.black),
                                  )),
                                ],
                              ),
                              height: 50.h,
                            )),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 11,
                      crossAxisCount: 3,
                      mainAxisSpacing: 2),
                ),
              ),
            ),
          ),
        ));
  }
}
