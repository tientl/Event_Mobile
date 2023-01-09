import 'package:event_app/src/presentation/admin_list_user/admin_list_user_controller.dart';
import 'package:get/get.dart';

class AdminListUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminListUserController());
  }
}
