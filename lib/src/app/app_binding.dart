import 'package:event_app/src/common/network/api_provider.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  AppBinding();
  @override
  void dependencies() {
    final apiProvider = ApiProvider();
    Get.put<ApiProvider>(apiProvider);
  }
}
