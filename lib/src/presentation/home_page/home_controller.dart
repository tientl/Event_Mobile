import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiengviet/tiengviet.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final user = AppManager().currentUser;
  final listEventConfirm = <Event>[].obs;
  final listEventUnconfirm = <Event>[].obs;
  final UserRepositories userRepositories;
  final searchController = TextEditingController();
  HomeController(this.userRepositories);

  @override
  void onReady() {
    if (user == null) AlertDialogWidget.show();
    super.onReady();
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    if (user != null && user!.listEvent != null) {
      listEventConfirm.value = user!.listConfirmEvent!;
      listEventUnconfirm.value = user!.listUnconfirmEvent!;
    }
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> onConfirmEvent(int index) async {
    final confirmRes = await userRepositories.confirmEvent(
        listEventUnconfirm[index].id, AppManager().currentUser!.id);
    if (confirmRes.isSuccess() && confirmRes.data != null) {
      user!.listEvent!
          .where((element) => element == listEventUnconfirm[index])
          .first
          .isComfirm = true;
      listEventUnconfirm[index].isComfirm = true;
      listEventConfirm.insert(0, listEventUnconfirm[index]);
      listEventUnconfirm.removeAt(index);
      listEventUnconfirm.refresh();
      listEventConfirm.refresh();
    } else {
      AlertDialogWidget.show(content: confirmRes.message);
    }
  }

  void onNavigateEventRootApp(Event event) {
    Get.toNamed(AppRoutes.rootApp, arguments: event);
  }

  void onNavigateProfile() {
    Get.toNamed(AppRoutes.profile, arguments: true);
  }

  onChangeSearch(String value) {
    final searchKey = TiengViet.parse(value.trim()).toLowerCase();
    if (tabController.index == 0 && user?.listConfirmEvent != null) {
      listEventConfirm.value = user!.listConfirmEvent!
          .where((p0) =>
              TiengViet.parse(p0.name!).toLowerCase().contains(searchKey))
          .toList();
    } else {
      if (user?.listUnconfirmEvent != null) {
        listEventUnconfirm.value = user!.listUnconfirmEvent!
            .where((p0) =>
                TiengViet.parse(p0.name!).toLowerCase().contains(searchKey))
            .toList();
      }
    }
  }
}
