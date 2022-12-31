import 'package:event_app/src/presentation/admin_find_page/admin_find_controller.dart';
import 'package:get/get.dart';

class AdminFindBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AdminFindController());
  }
}