import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/data/model/enum/tab_item.dart';
import 'package:event_app/src/data/model/enum/type_of_dialog.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/presentation/barcode/barcode_page.dart';
import 'package:event_app/src/presentation/home_event/home_event_page.dart';
import 'package:event_app/src/presentation/profile_event/profile_event_page.dart';
import 'package:event_app/src/presentation/schedule_page/schedule_page.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootAppController extends GetxController {
  final UserRepositories userRepository;

  RootAppController(this.userRepository);
  final currentTab = TabItem.home.obs;
  final currentEventId = 0.obs;
  final curentRating = 0.obs;
  final ratingController = TextEditingController();
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
      case TabItem.barcode:
        return const QRCodePage();
      default:
        return const ProfileEventPage();
    }
  }
  onRatingEvent() async {
    final resRating = await userRepository.ratingEvent(
        userId: currentUser!.id,
        rating: curentRating.value,
        eluvate: ratingController.text,
        isEvent: true,
        eventId:currentEventId.value );
    ratingController.text = '';
    
    if (resRating.isSuccess()){
      Get.back();
      AlertDialogWidget.show(content: 'Cảm ơn đánh giá của bạn', typeOfDialog: TypeOfDialog.success);
    }
    else{
      Get.back();
      AlertDialogWidget.show(content: resRating.message);
    }
  }

  onRatingUpdate(double rating) {
    curentRating.value = rating.round();
  }

  @override
  void dispose() {
    ratingController.dispose();
    super.dispose();
  }
}
