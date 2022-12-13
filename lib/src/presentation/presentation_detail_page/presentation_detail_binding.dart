import 'package:event_app/src/presentation/presentation_detail_page/presentation_detail_page_controller.dart';
import 'package:get/get.dart';

class PresentationDetailBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<PresentstionDetailController>(() => PresentstionDetailController());
  }
}