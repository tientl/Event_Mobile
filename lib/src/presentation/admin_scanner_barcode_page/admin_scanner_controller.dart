import 'dart:convert';

import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/widget/alert_dialog_widget.dart';
import 'package:event_app/src/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AdminScannerController extends GetxController {
  AdminScannerController(this.userRepositories);

  final UserRepositories userRepositories;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final result = Rxn<Barcode>(null);
  final currentUser = AppManager().currentUser;
  final currentEvent = AppManager().currentEvent;

  onDetect(Barcode barcode , MobileScannerArguments? args)async  {
    final eventId =  int.parse(jsonDecode(barcode.rawValue!)['id_event']);
     final userId =  int.parse(jsonDecode(barcode.rawValue!)['id_user']);

      final scannerRes = await userRepositories.scannerQR(
          userId: userId, eventId:  eventId);
      if (scannerRes.isSuccess()){
       Get.toNamed(AppRoutes.success, arguments:scannerRes.data );
      }
      else{
        AlertDialogWidget.show();
      }
  }
   

  // void onQRViewCreated(QRViewController controller) async {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) async {
  //     result.value = scanData;
  //     final userId =int.parse(jsonDecode(scanData.code!)['id_user']) ;
  //     final eventId = int.parse(jsonDecode(scanData.code!)['id_event']);
  //     final scannerRes = await userRepositories.scannerQR(
  //         userId: userId, eventId:  eventId);
  //     if (scannerRes.isSuccess()){
       
  //     }
  //     else{
  //       AlertDialogWidget.show();
  //     }
  //   });
  // }


}
