import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/data/model/enum/tab_item.dart';
import 'package:event_app/src/presentation/barcode/barcode_page.dart';
import 'package:event_app/src/presentation/home_event/home_event_page.dart';
import 'package:event_app/src/presentation/home_page/home_page.dart';
import 'package:event_app/src/presentation/profile_event/profile_event_page.dart';
import 'package:event_app/src/presentation/schedule/schedule_page.dart';
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

  PreferredSizeWidget? getAppBar({required TabItem tabItem}) {
    switch (tabItem) {
      case TabItem.home:
        return null;
      case TabItem.schedule:
        return AppBarWidget(
          title: tabItem.name,
        );
      case TabItem.barcode:
        return AppBarWidget(title: tabItem.name);
      case TabItem.profile:
        return AppBarWidget(
          title: tabItem.name,
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
      case TabItem.barcode:
        return const BarcodePage();
      default:
        return const ProfileEventPage();
    }
  }
}
