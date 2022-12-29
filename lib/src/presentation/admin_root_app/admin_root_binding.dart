import 'package:event_app/src/presentation/admin_home_page/admin_home_controller.dart';
import 'package:event_app/src/presentation/admin_root_app/admin_root_controller.dart';
import 'package:event_app/src/presentation/admin_scanner_barcode_page/admin_scanner_controller.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:get/get.dart';

class AdminRootAppBinding extends Bindings {
  @override
  void dependencies() {
    final userRepository = Get.find<UserRepositories>();
    Get.lazyPut<AdminRootAppController>(() => AdminRootAppController(userRepository));
    Get.put<AdminHomeController>(AdminHomeController());
    Get.put(AdminScannerController(userRepository));
  }
}
