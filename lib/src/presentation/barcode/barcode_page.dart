import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/presentation/barcode/barcode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QRCodePage extends GetView<BarcodeController> {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBarWidget(title: 'your_barcode'.tr),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: SizedBox(
                  width: Get.width,
                  child: Column(children: [
                    // Text(
                    //   controller.currentUser?.name ?? 'no_name'.tr,
                    //   style: Theme.of(context).textTheme.headline4,
                    // ),
                    SizedBox(
                      height: 8.h,
                    ),
                    // Text(
                    //   controller.getGenderAndBirth(),
                    //   style: Theme.of(context).textTheme.bodyText1,
                    // ),
                    SizedBox(
                      height: 16.h,
                    ),
                    // QrImage(
                    //   data: controller.currentuser.value!.pId,
                    //   version: QrVersions.auto,
                    //   size: 260.r,
                    //   gapless: false,
                    // ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'please_give_qr_code_for_employee'.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          )
        ],
      ),
    );
  }
}
