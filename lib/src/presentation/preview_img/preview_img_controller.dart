import 'package:get/get.dart';

class PreviewImageController extends GetxController{

  final imgUrl = ''.obs;

  @override
  void onInit() {
   
   final argurment = Get.arguments;
   if (argurment is String){
    imgUrl.value = argurment;
   }
    super.onInit();
  }
}