import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pos_sys/Colors/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_sys/constants/constant.dart';
import 'package:pos_sys/features/branches/Data/Model/branch_model.dart';
import 'package:pos_sys/features/tables/Presentation/Provider/table_provider.dart';
import 'package:pos_sys/features/tables/Presentation/Screen/home.dart';
import 'package:provider/provider.dart';

import '../../../../constants/Dialogs/normal_faliure_dialog.dart';
import '../../../../constants/Error/faliure.dart';

class BranchePage extends StatelessWidget {
  BranchePage({Key? key}) : super(key: key);
  final List<BranchModel> branchList = [
    BranchModel(
        id: 1,
        branchName: 'مصر الجديدة',
        branchNum: '01112601115',
        branchAddress: 'مصر الجديدة المطار النزهة 4'),
    BranchModel(
        id: 2,
        branchName: 'شبرا مصر',
        branchNum: '01112601115',
        branchAddress: '35 شارع فخر الدين روض الفرج'),
    BranchModel(
        id: 3,
        branchName: 'مدينة نصر',
        branchNum: '01112344115',
        branchAddress: '6 سيتي سنتر الماظة الدور الأول')
  ];
  @override
  Widget build(BuildContext context) {
    var tableProv = Provider.of<TableProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          'اختر الفرع',
        ),
        centerTitle: true,
        backgroundColor: ColorManager.primaryCol,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      displayLoadingDialog(context);
                      await tableProv.getTablesByBranchID(branchList[index].id);
                      Navigator.pop(context);
                      if (tableProv.responseMsg == SUCCESS_MSG) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TablePage(tableList: tableProv.tablesList),
                            ));
                      } else {
                        log("res msg : ${tableProv.responseMsg}");
                        if (tableProv.responseMsg == SERVER_FAILURE_MESSAGE ||
                            tableProv.responseMsg == OFFLINE_FAILURE_MESSAGE) {
                          displayErrorDialog(context, tableProv.responseMsg);
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => ZoomIn(
                                      child: FaliureDialog(
                                    faliureMsg: tableProv.responseMsg,
                                  )));
                        }
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => TablePage(),
                      //     ));
                    },
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 50.h,
                                child: Center(
                                    child: AutoSizeText(
                                  branchList[index].branchName,
                                  style: boldStyle!
                                      .copyWith(color: ColorManager.textCol),
                                ))),
                            const Divider(),
                            Align(
                                alignment: Alignment.centerRight,
                                child: AutoSizeText(
                                    '  العنوان : ${branchList[index].branchAddress}')),
                            const Divider(),
                            Align(
                                alignment: Alignment.centerRight,
                                child: AutoSizeText(
                                    'رقم التليفون  : ${branchList[index].branchNum}'))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: branchList.length),
          ),
        ),
      ),
    );
  }
}
