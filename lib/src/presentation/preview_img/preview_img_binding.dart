import 'package:event_app/src/presentation/preview_img/preview_img_controller.dart';
import 'package:get/get.dart';

class PreviewImgBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PreviewImageController());
  }

}