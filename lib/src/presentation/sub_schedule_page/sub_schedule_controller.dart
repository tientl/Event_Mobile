import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/data/model/enum/type_of_dialog.dart';
import 'package:event_app/src/data/model/presentation.dart';
import 'package:event_app/src/data/model/sub_schedule.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubScheduleController extends GetxController {
  final UserRepositories userRepositories;

  SubScheduleController(this.userRepositories);
  final formKey =const GlobalObjectKey<FormState>(4);
  final subSchedule = Rxn<SubSchedule>(null);
  final date = ''.obs;
  final currentRating = 0.0.obs;
  final eventId = 0.obs;
  final ratingController = TextEditingController();
  final currentUser = AppManager().currentUser;

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument['subschedule'] is SubSchedule && argument['date'] is String) {
      subSchedule.value = argument['subschedule'];
      date.value = argument['date'];
      eventId.value = argument['event_id'];
    }
    super.onInit();
  }

  @override
  void dispose() {
    ratingController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    if (subSchedule.value == null) {
      AlertDialogWidget.show(onPress: () => Get.close(2));
    }
    super.onReady();
  }

  getListSpeakerName() {
    late String result = '';
    subSchedule.value?.presentation?.speaker
        ?.map((e) => result += e.name != null ? '${e.name} ' : '');
  }

  onNavigateToPresentationDetailPage(Presentation presentation) {
    final argument = {
      'presentation': presentation,
      'total_hour': subSchedule.value?.totalHour ?? 0,
      'location': subSchedule.value?.location ?? 'Chưa xác định'
    };
    Get.toNamed(AppRoutes.presentationDetail, arguments: argument);
  }

  String? onValidRating(String? rating){
    if (rating == null || rating.isEmpty){
      return "Vui lòng nhập đánh giá";
    }
    return null;
  }

  onClickRatingSubSchedule() async {
    if (!formKey.currentState!.validate()) return;
 
    final ratingRes = await userRepositories.ratingEvent(
      eluvate: ratingController.text,
      eventId: eventId.value,
      isEvent: false,
      subScheduleId: subSchedule.value?.id,
      rating: currentRating.value.round(),
      userId: currentUser!.id,
    );
     ratingController.text = '';

    if (ratingRes.isSuccess()) {
      Get.back();
      AlertDialogWidget.show(content: 'Cảm ơn ý kiến đánh giá của bạn!', typeOfDialog: TypeOfDialog.success);
    } else {
      Get.back();
      AlertDialogWidget.show(content: ratingRes.message);
    }
  }

  onRatingUpdate(double rating) {
    currentRating.value = rating;
  }
}
