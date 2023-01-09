import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/data/model/enum/tab_item.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/presentation/admin_home_page/admin_home_page.dart';
import 'package:event_app/src/presentation/admin_scanner_barcode_page/admin_scanner_page.dart';
import 'package:event_app/src/presentation/profile_event/profile_event_page.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminRootAppController extends GetxController {
  final UserRepositories userRepository;

  AdminRootAppController(this.userRepository);
  final currentTab = TabItem.adminHome.obs;
  final currentEventId = 0.obs;
  final curentRating = 0.obs;
  final currentUser = AppManager().currentUser;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument is Event) {
      currentEventId.value = argument.id;
    }
    super.onInit();
  }

  void onChangeTabItem(TabItem tabItem) {
    currentTab.value = tabItem;
  }

  Color getColorIconTabBar(TabItem tabItem, BuildContext context) {
    return tabItem != currentTab.value
        ? tabItem.getUnSelectedColor(context)
        : tabItem.getSelectedColor(context);
  }

  PreferredSizeWidget? getAppBar(
      {required TabItem tabItem, required BuildContext context}) {
    switch (tabItem) {
      case TabItem.adminHome:
        return null;
      case TabItem.qrScanner:
      case TabItem.adminProfile:
        return AppBarWidget(
          backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
          leading: null,
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
      case TabItem.adminHome:
        return const AdminHomePage();
      case TabItem.qrScanner:
        return const AdminScannerPage();
      case TabItem.adminProfile:
        return const ProfilePage();
      default:
        return const AdminHomePage();
    }
  }

  onTapFloatingButton() {
    currentTab.value = TabItem.qrScanner;
  }
}
