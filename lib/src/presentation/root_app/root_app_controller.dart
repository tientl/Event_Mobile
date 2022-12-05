import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/data/model/enum/tab_item.dart';
import 'package:event_app/src/presentation/barcode/barcode_page.dart';
import 'package:event_app/src/presentation/home_event/home_event_page.dart';
import 'package:event_app/src/presentation/home_page/home_page.dart';
import 'package:event_app/src/presentation/profile_event/profile_event_page.dart';
import 'package:event_app/src/presentation/schedule_page/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootAppController extends GetxController {
  final currentTab = TabItem.home.obs;

  void onChangeTabItem(TabItem tabItem) {
    currentTab.value = tabItem;
  }

  Color getColorIconTabBar(TabItem tabItem, BuildContext context) {
    return tabItem != currentTab.value
        ? tabItem.getUnSelectedColor(context)
        : tabItem.getSelectedColor(context);
  }

  PreferredSizeWidget? getAppBar({required TabItem tabItem,required BuildContext context}) {
    switch (tabItem) {
      case TabItem.home:
        return null;
      case TabItem.schedule:
    
      case TabItem.barcode:
       case TabItem.profile:
        return AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: tabItem.name,
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      );
   
      default:
        return null;
    }
  }

  Widget getBody(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return const HomeEventPage();
      case TabItem.schedule:
        return const SchedulePage();
      // case TabItem.barcode:
      //   return const BarcodePage();
      default:
        return const ProfileEventPage();
    }
  }
}
