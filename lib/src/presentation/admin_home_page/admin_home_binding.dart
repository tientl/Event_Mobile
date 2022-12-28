import 'package:event_app/src/presentation/admin_home_page/admin_home_controller.dart';
import 'package:get/get.dart';

class AdminHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AdminHomeController());
  }
}