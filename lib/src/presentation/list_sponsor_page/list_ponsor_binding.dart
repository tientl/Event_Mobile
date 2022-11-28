import 'package:event_app/src/presentation/list_sponsor_page/list_sponsor_controller.dart';
import 'package:get/get.dart';

class ListSponsorBinding extends Bindings{
  @override
  void dependencies() {
 Get.lazyPut<ListSponsorController>(() => ListSponsorController());
  }
}