import 'package:event_app/src/presentation/list_user_page/list_user_controller.dart';
import 'package:get/get.dart';

class ListUserBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ListUserController>(() => ListUserController());
}}