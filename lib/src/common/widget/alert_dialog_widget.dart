import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/data/model/enum/type_of_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends StatelessWidget {
  final TypeOfDialog type;
  final String content;
  final String textButton;
  final List<Widget>? actions;
  final VoidCallback? onPressButton;
  final String? title;
  const AlertDialogWidget(
      {Key? key,
      this.type = TypeOfDialog.success,
      required this.content,
      required this.textButton,
      this.onPressButton,
      this.actions,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: AppConstant.width - 120.w,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: Stack(children: [
          CustomPaint(
            painter: CurvePainter(
                primaryColor: type.getColor(context).withOpacity(0.1)),
            size: Size(AppConstant.width - 40, AppConstant.height / 4.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    type.iconPath,
                    height: 120.h,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Text(
                    title ?? type.title,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).canvasColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).canvasColor.withOpacity(0.6),
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: ElevatedButton(
                      onPressed: onPressButton,
                      style: type.getButtonStyle(context),
                      child: Text(
                        textButton,
                        style: TextStyle(color: type.getTextColor(context)),
                      ),
                    ),
                  ),
                ]),
          )
        ]),
      ),
    );
  }

  static void hideDialog() {
    if (Get.isDialogOpen == null) return;
    if (Get.isDialogOpen!) Get.back();
  }

  static void show(
      {bool? barrierDismissible,
      String? content,
      String? title,
      String? textButton,
      VoidCallback? onPress,
      TypeOfDialog? typeOfDialog}) {
    Get.dialog(
        barrierDismissible: barrierDismissible ?? true,
        AlertDialogWidget(
          title: title,
          content: content ?? 'systerm_error'.tr,
          textButton: textButton ?? 'confirm'.tr,
          onPressButton: onPress ?? Get.back,
          type: typeOfDialog ?? TypeOfDialog.error,
        ));
  }
}
class CurvePainter extends CustomPainter {
  final Color primaryColor;

  CurvePainter({required this.primaryColor});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = primaryColor;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height / 1.5);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 1.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}