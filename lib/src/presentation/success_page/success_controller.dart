import 'package:event_app/src/data/model/user.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController{
  final user = Rxn<User>(null);

  @override
  void onInit() {
    final argument = Get.arguments;
    if (argument is User){
      user.value = argument;
    }
    super.onInit();
  }

}