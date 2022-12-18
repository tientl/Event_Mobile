import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/enum/type_of_dialog.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeEventController extends GetxController {
  final UserRepositories userRepository;

  HomeEventController(this.userRepository);
  final currentEvent = Rxn<Event>(null);
  final ratingController = TextEditingController();
  final curentRating = 0.obs;
  final formKey = GlobalKey<FormState>();
  final currentUser = AppManager().currentUser;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument is Event) currentEvent.value = argument;
    super.onInit();
  }

  @override
  void onReady() {
    if (currentEvent.value == null) {
      AlertDialogWidget.show(onPress: () => Get.close(2));
    }
    super.onReady();
  }

  onNavigateToListSponsor() {
    Get.toNamed(AppRoutes.listSponsor, arguments: currentEvent.value?.sponsor);
  }

  onNavigateToListSpeaker() {
    Get.toNamed(AppRoutes.listUser, arguments: currentEvent.value?.speakers);
  }

  onNavigateToListResgistration() async {
    await Get.toNamed(AppRoutes.listUser,
        arguments: currentEvent.value?.registrations);
  }

  onRatingEvent() async {
    if (!formKey.currentState!.validate()) return;
    final resRating = await userRepository.ratingEvent(
        userId: currentUser!.id,
        rating: curentRating.value,
        eluvate: ratingController.text,
        isEvent: true,
        eventId: currentEvent.value?.id);
    ratingController.text = '';

    if (resRating.isSuccess()) {
      Get.back();
      AlertDialogWidget.show(
          content: 'Cảm ơn đánh giá của bạn',
          typeOfDialog: TypeOfDialog.success);
    } else {
      Get.back();
      AlertDialogWidget.show(content: resRating.message);
    }
  }

  onRatingUpdate(double rating) {
    curentRating.value = rating.round();
  }

  onValidRating(String? rating) {
    if (rating == null || rating.isEmpty) {
      return "Vui lòng nhập đánh giá";
    }
  }
}
