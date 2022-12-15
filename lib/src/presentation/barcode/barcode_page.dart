import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/presentation/barcode/barcode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends GetView<BarcodeController> {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: SizedBox(
                width: AppConstant.width,
                child: Column(children: [
                  Text(
                     controller.currentUser?.userName ?? 'no_name'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color:const Color(0xff0F2851)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                   'Số điện thoại: ${controller.currentUser?.mobile ?? 'Chưa có sđt'}',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color:const Color(0xff8A96BC), fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  QrImage(
                    data: controller.dataQr.value,
                    version: QrVersions.auto,
                    foregroundColor:const Color(0xff0F2851),
                    size: 260.r,
                    gapless: false,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).primaryColor,
                    size: 24.r,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Vui lòng đưa mã QR cho nhân viên để checkin tham gia sự kiện',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color:const Color(0xff8A96BC)),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
