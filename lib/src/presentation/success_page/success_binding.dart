import 'package:event_app/src/presentation/success_page/success_controller.dart';
import 'package:get/get.dart';

class SuccessBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SuccessController());
  }
}