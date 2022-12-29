import 'package:event_app/src/presentation/choice_event_page/choice_event_controller.dart';
import 'package:get/get.dart';

class ChoiceEventBinding extends Bindings{
  @override
  void dependencies() {
    
    Get.lazyPut(() => ChoiceEventController());
  }

}