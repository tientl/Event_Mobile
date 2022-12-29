import 'package:event_app/src/presentation/admin_scanner_barcode_page/admin_scanner_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AdminScannerPage extends GetView<AdminScannerController> {
  const AdminScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
          allowDuplicates: true,
          onDetect: controller.onDetect),
    );
  }
}
