import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/presentation/preview_img/preview_img_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PreviewImagePage extends GetView<PreviewImageController> {
  const PreviewImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
    child: PhotoView(
      imageProvider:NetworkImage(controller.imgUrl.value),
    ),
    ));
  }
}