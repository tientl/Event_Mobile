import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:get/get.dart';

class HomeEventController extends GetxController{

  onNavigateToListSponsor(){
    Get.toNamed(AppRoutes.listSponsor);
  }

  onNavigateToListSpeaker(){
    Get.toNamed(AppRoutes.listUser);
  }
  
}