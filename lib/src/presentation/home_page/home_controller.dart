import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final user = AppManager().currentUser;
  final listEventConfirm = <Event>[].obs;
  final listEventUnconfirm = <Event>[].obs;
  final UserRepositories userRepositories;
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
      listEventUnconfirm[index].isComfirm = true;
      listEventConfirm.insert(0, listEventUnconfirm[index]);
      listEventUnconfirm.removeAt(index);
      listEventUnconfirm.refresh();
      listEventConfirm.refresh();
    } else {
      AlertDialogWidget.show(content: confirmRes.message);
    }
  }
}
