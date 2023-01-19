import 'package:event_app/src/presentation/admin_scanner_barcode_page/admin_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AdminScannerPage extends GetView<AdminScannerController> {
  const AdminScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) async =>
            await controller.onDetect(barcode, args),
      ),
    );
  }
}
