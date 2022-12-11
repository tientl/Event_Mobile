import 'package:event_app/src/data/model/enum/tab_item.dart';
import 'package:event_app/src/presentation/root_app/root_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
