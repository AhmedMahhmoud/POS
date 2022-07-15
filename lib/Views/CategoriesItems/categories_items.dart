import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_sys/Providers/CategoryProv/category.dart';
import 'package:provider/provider.dart';

import '../../Colors/color_manager.dart';
import '../../constants/Shared/Header/page_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constant.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var catItems =
        Provider.of<CategoryProv>(context, listen: false).currentItems;
    return Scaffold(
        backgroundColor: ColorManager.backgroundCol,
        body: PageHeader(
          headerTitle: 'اختر المنتج',
          widget: Positioned(
            top: 90.h,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: GridView.builder(
                  itemCount: catItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<CategoryProv>(context, listen: false)
                            .resetTotalAndIndex(index);
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: SlideInUp(
                                duration: const Duration(seconds: 1),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Consumer<CategoryProv>(
                                      builder: (context, catProv, _) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.w),
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight:
                                                      Radius.circular(30))),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 90.w,
                                                      height: 80.h,
                                                      child: Hero(
                                                        tag: catItems[index].id,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            catItems[index]
                                                                .photo,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    AutoSizeText(
                                                      catItems[index].itemName,
                                                      style: boldStyle!.copyWith(
                                                          fontSize:
                                                              setResponsiveFontSize(
                                                                  19),
                                                          color: Colors.black),
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color:
                                                                  Colors.black),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      width: 100.w,
                                                      height: 30,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                catProv.updateQuantity(
                                                                    index,
                                                                    Operation
                                                                        .add);
                                                              },
                                                              child: Icon(
                                                                FontAwesomeIcons
                                                                    .plus,
                                                                size:
                                                                    setResponsiveFontSize(
                                                                        15),
                                                              ),
                                                            ),
                                                            AutoSizeText(
                                                              catProv
                                                                  .quantityTemp
                                                                  .toString(),
                                                              style: boldStyle!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .black),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                catProv.updateQuantity(
                                                                    index,
                                                                    Operation
                                                                        .subtract);
                                                              },
                                                              child: Icon(
                                                                FontAwesomeIcons
                                                                    .minus,
                                                                size:
                                                                    setResponsiveFontSize(
                                                                        15),
                                                              ),
                                                            ),
                                                          ]),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 25.h,
                                                ),
                                                AutoSizeText(
                                                  'سعر المنتج : ${catProv.currentItems[index].price}',
                                                  style: boldStyle?.copyWith(
                                                      color: Colors.black,
                                                      fontSize:
                                                          setResponsiveFontSize(
                                                              19)),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                const Divider(
                                                  thickness: 1,
                                                ),
                                                AutoSizeText(
                                                  'الكمية المتوفرة : ${catProv.currentItems[index].quantity}',
                                                  style: boldStyle?.copyWith(
                                                      color: Colors.black,
                                                      fontSize:
                                                          setResponsiveFontSize(
                                                              19)),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                const Divider(
                                                  thickness: 1,
                                                ),
                                                const Spacer(),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 5.h),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    color:
                                                        ColorManager.primaryCol,
                                                    width: double.infinity,
                                                    height: 50.h,
                                                    child: Row(
                                                        children: [
                                                          AutoSizeText(
                                                            'إتمام الطلب',
                                                            style: boldStyle,
                                                          ),
                                                          AutoSizeText(
                                                            'السعر : ${catProv.totalPriceTemp}',
                                                            style: boldStyle,
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween),
                                                  ),
                                                )
                                              ]),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
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
                                    child: Hero(
                                      tag: catItems[index].photo,
                                      child: Image.network(
                                        catItems[index].photo,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Expanded(
                                    child: AutoSizeText(
                                      catItems[index].itemName.toString(),
                                      style: boldStyle!.copyWith(
                                          color: Colors.black,
                                          fontSize: setResponsiveFontSize(16)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
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
