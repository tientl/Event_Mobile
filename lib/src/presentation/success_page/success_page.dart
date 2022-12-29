import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/app/app_manager.dart';
import 'package:event_app/src/common/style.dart';
import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/presentation/success_page/success_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessPage extends GetView<SuccessController> {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Stack(
        children: [
          Container(
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 30.h),
            child: ButtonWidget(
              lable: 'Trở về trang chủ'.tr,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              onPressed: () => Get.back(),
            ),
          ),
               
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      ClipPath(
                        clipper: CustomShapeClass(),
                        child: Container(
                          width: AppConstant.width,
                          height: 280.h,
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: AppConstant.width / 2 - 56.r,
                    child: SizedBox(
                      child: Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Theme.of(context).backgroundColor),
                        child: Icon(
                          Icons.task_alt,
                          color: Theme.of(context).primaryColor,
                          size: 80.r,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                '${'Check-in thành công'.tr}!',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Bạn đã check-in thành công với sự kiện ${AppManager().currentEvent?.name}'
                      .tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).dividerColor),
                ),
              ),
              Text(
                  '\n\nTên: ${controller.user.value?.fullName}\nVị trí: ${controller.user.value?.position}\nCông ty: ${controller.user.value?.company}'),
            ],
          )),
         Positioned(
                    top: 40.h,
                    left: 20.w,
                    child: Container(
                      height: 44.r,
                      width: 44.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Theme.of(context).backgroundColor,
                          boxShadow:
                              CommonStyle.boxShadowDefault(context: context)),
                      child: IconButton(
                        onPressed: Get.back,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20.r,
                        ),
                        constraints: const BoxConstraints(),
                        splashRadius: 20.r,
                      ),
                    ))
        ],
      ),
    );
  }
}

class CustomShapeClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50.h);
    path.quadraticBezierTo(width / 2, height, width, height - 50.h);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
