import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/row_infor_with_icon_widget.dart';
import 'package:event_app/src/data/model/presentation.dart';
import 'package:event_app/src/presentation/sub_schedule_page/sub_schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubSchedulePage extends GetView<SubScheduleController> {
  const SubSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Chi tiết',
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            controller.subSchedule.value?.name ?? 'Chưa xác định',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            ' Được tổ chức bởi',
            style: TextStyle(fontSize: 16.sp, color: const Color(0xff8696BB)),
          ),
          SizedBox(
            height: 40.h,
          ),
          Obx(() =>RowInfoWithIconWidget(
            iconData: Icons.calendar_today_rounded,
            content: controller.date.value,
          ) )
          ,
          RowInfoWithIconWidget(
              content:
                  controller.subSchedule.value?.location ?? 'Chưa xác định',
              iconData: Icons.location_on),
          RowInfoWithIconWidget(
              content: controller.subSchedule.value?.beginEndTimeTotal ?? '-',
              iconData: Icons.timer),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Bài diễn thuyết',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          controller.subSchedule.value?.presentation != null
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    PresentationWidget(
                      onTap: () => controller.onNavigateToPresentationDetailPage(controller.subSchedule.value!.presentation!),
                        present: controller.subSchedule.value!.presentation!)
                  ]),
                )
              : const SizedBox(),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Chi tiết lịch trình',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            controller.subSchedule.value?.detail ?? 'Chưa có lịch trình cụ thể',
            style: TextStyle(color: const Color(0xff8A96BC), fontSize: 16.sp),
          )
        ]),
      )),
    );
  }
}

class PresentationWidget extends StatelessWidget {
  const PresentationWidget({Key? key, required this.present, this.onTap}) : super(key: key);
  final Presentation present;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.white,
            border: Border.all(color: const Color(0xff5A75A7))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children: [
            CircleAvatar(
              child: Image.asset('assets/images/default/file.png'),
            ),
            SizedBox(
              width: 20.w,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '${present.name}\n',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0F2851))),
              TextSpan(
                  text: '${present.id}',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff6B7280)))
            ]))
          ]),
          Divider(
            height: 40.h,
            color: const Color(0xff6B7280),
          ),
          Text(
           present.listSpeakerName ,
            style: TextStyle(color: const Color(0xff0F75BD), fontSize: 16.sp),
          )
        ]),
      ),
    );
  }
}

