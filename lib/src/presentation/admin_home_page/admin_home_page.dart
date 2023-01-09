import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/app/app_routes/app_routes.dart';
import 'package:event_app/src/common/style.dart';
import 'package:event_app/src/presentation/admin_home_page/admin_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdminHomePage extends GetView<AdminHomeController> {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPaint(
              painter: CurvePainter(
                  primaryColors:
                      Theme.of(context).primaryColor.withOpacity(0.2)),
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 70.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Text(
                            controller.event.value?.name ?? 'no_define'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color: Theme.of(context).backgroundColor),
                          ),
                        ),
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: '${'Xin chào'.tr},\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: Theme.of(context).backgroundColor,
                                      fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: controller.user?.fullName == ''
                                  ? 'Admin'
                                  : controller.user?.fullName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: Theme.of(context).backgroundColor))
                        ])),
                        Container(
                          height: 32.h,
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(AppRoutes.adminSearch),
                          child: Container(
                              alignment: Alignment.centerLeft,
                              height: 44.h,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 3),
                                        blurRadius: 8.r,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2)),
                                    BoxShadow(
                                        offset: const Offset(3, 0),
                                        blurRadius: 8.r,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2)),
                                    BoxShadow(
                                        offset: const Offset(3, 3),
                                        blurRadius: 8.r,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2)),
                                  ],
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(5.r)),
                              child: TextField(
                                enabled: false,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(fontWeight: FontWeight.normal),
                                textAlignVertical: TextAlignVertical.center,
                                maxLines: 1,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: CommonStyle.searchBarStyle(
                                    context: context),
                                onChanged: (String keyword) {
                                  //TODO: add late with logic homepage
                                },
                              )),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => controller.onNavigateToListRegistation(),
                          child: Container(
                            width: AppConstant.width / 2 - 30.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color(0xff7A3CDA),
                                Color(0xff9046FF)
                              ]),
                              borderRadius: BorderRadius.circular(20.r),
                              //color: const Color(0xff7A3CDA)
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 36.r,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${controller.event.value?.registrations?.length ?? 0}',
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ])),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text('NGƯỜI THAM DỰ',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ))
                                ]),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        InkWell(
                          onTap: () => controller.onNavigateToListNoCheckIn(),
                          child: Container(
                            width: AppConstant.width / 2 - 30.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color(0xff2BCAE5),
                                Color(0xff2BCAE5)
                              ]),
                              borderRadius: BorderRadius.circular(20.r),
                              //color: const Color(0xff7A3CDA)
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.language,
                                        color: Colors.white,
                                        size: 36.r,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${controller.event.value?.totalUnCheckIn}',
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ])),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text('CHƯA CHECK-IN',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ))
                                ]),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      'Danh sách check-in',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() => _buildDataGrid(context)),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildDataGrid(BuildContext context) {
    return SfDataGrid(
        onCellTap: (details) => {},
        gridLinesVisibility: GridLinesVisibility.both,
        headerGridLinesVisibility: GridLinesVisibility.both,
        selectionMode: SelectionMode.none,
        columnWidthMode: ColumnWidthMode.fill,
        columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
        source: controller.medicalTestDataSource.value,
        columns: [
          GridColumn(
              columnName: 'Họ và tên'.tr,
              label: Container(
                padding: EdgeInsets.only(left: 16.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Họ và tên'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          GridColumn(
              columnName: 'checkin'.tr,
              label: Container(
                padding: EdgeInsets.only(left: 16.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Thời gian check-in'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
        ]);
  }
}

class CurvePainter extends CustomPainter {
  final Color primaryColors;

  CurvePainter({required this.primaryColors});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint();

    path.lineTo(0, size.height);

    path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
        size.width * 0.17, size.height * 0.90);

    path.quadraticBezierTo(
        size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);

    path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
        size.width * 0.50, size.height * 0.70);

    path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
        size.width * 0.65, size.height * 0.65);

    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.90, size.width, 0);

    path.close();

    paint.color = primaryColors.withOpacity(0.2);

    canvas.drawPath(path, paint);

    path = Path();

    path.lineTo(0, size.height);

    path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.70);

    path.quadraticBezierTo(size.width * 0.20, size.height * 0.8,
        size.width * 0.27, size.height * 0.70);

    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);

    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);

    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);

    path.lineTo(size.width, 0);

    path.close();

    paint.color = primaryColors.withOpacity(0.5);

    canvas.drawPath(path, paint);

    paint.color = primaryColors;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
