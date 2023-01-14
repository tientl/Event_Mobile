import 'package:event_app/src/presentation/choice_service_page/choice_service_controller.dart';
import 'package:get/get.dart';

class ChoiceServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChoiceServiceControlller());
  }
}
