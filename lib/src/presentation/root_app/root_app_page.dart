import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/data/model/enum/tab_item.dart';
import 'package:event_app/src/presentation/root_app/root_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RootApp extends GetView<RootAppController> {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor:Colors.white,
          body: controller.getBody(controller.currentTab.value),
          appBar: controller.getAppBar(tabItem: controller.currentTab.value, context: context),
          bottomNavigationBar: getBottomBarnavigation(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }

  IconButton _buildTabItem(TabItem tabItem, BuildContext context) {
    return IconButton(
      icon: Icon(
        tabItem.icon,
        color: controller.getColorIconTabBar(tabItem, context),
        size: 25.r,
      ),
      onPressed: () => controller.onChangeTabItem(tabItem),
      splashRadius: 25.r,
    );
  }

  
  Widget getFloatingActionButton(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0,
      child: SizedBox(
        height: 55.r,
        width: 55.r,
        child: FloatingActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    scrollable: true,
                    title: Column(
                      children: [
                        Text(
                          'Đánh giá sự kiện',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color(0xff0F2851),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Vui lòng cho chúng tôi biết trải nghiệm của bạn',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff8A96BC), fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RatingBar.builder(
                          initialRating: 1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 32.r,
                          itemPadding:   EdgeInsets.symmetric(horizontal: 4.w),
                          itemBuilder: (context, _) =>   Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 32.r,
                          ),
                          onRatingUpdate: (rating) {
                            controller.onRatingUpdate(rating);
                          },
                        ),
                        SizedBox(height: 20.h,),
                        Form(
                          key: controller.formKey,
                          child: TextFormField(
                            validator: (value) => controller.onValidRating(value),
                          controller: controller.ratingController,
                          decoration: InputDecoration(
                              hintText: 'Nhập đánh giá của bạn',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff8A96BC)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                      color: const Color(0xff0F2851)
                                          .withOpacity(0.2))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                      color: const Color(0xff0F2851)
                                          .withOpacity(0.2)))),
                        ), ),
                       
                        SizedBox(
                          height: 20.h,
                        ),
                        ButtonWidget(
                          lable: 'Đánh giá',
                          borderRadius: BorderRadius.circular(8.r),
                          onPressed: controller.onRatingEvent,
                        )
                      ],
                    ),
                  )), 
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            FontAwesomeIcons.pen,
            color: Colors.white,
            size: 20.r,
          ),
        ),
      ),
    );
  }
  Widget getBottomBarnavigation(BuildContext context) {
    return Container(
      height: 54.h,
      margin: EdgeInsets.fromLTRB(15.w, 0, 15.w, 20.h),
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10.r,
                offset: const Offset(0, 3))
          ]),
      child: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        elevation: 0,
        notchMargin: 0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildTabItem(TabItem.home, context),
            Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: _buildTabItem(TabItem.schedule, context)),
            Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: _buildTabItem(TabItem.barcode, context)),
            _buildTabItem(TabItem.profile, context),
          ],
        ),
      ),
    );
  }
}
