import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleItemPage extends StatelessWidget {
  const ScheduleItemPage({super.key});

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
        child: Column(children: [
          Text(
            'Gặp mặt giao lưu',
            style: TextStyle(color: const Color(0xff0F2851), fontSize: 24.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Duoc to chuc boi Cty Intesco',
            style: TextStyle(color: const Color(0xff8696BB), fontSize: 16.r),
          ),
          SizedBox(
            height: 32.h,
          ),
          IconInforWidget(
              content: 'Thu 4, 23/07/2022', icon: Icons.calendar_month_rounded),
          IconInforWidget(
              content: 'Sảnh A khu nghỉ dưỡng ABDABD', icon: Icons.location_on),
          IconInforWidget(
              content: '12:00 - 13:00 (2 gio)', icon: Icons.timer),
              SizedBox(height: 20.h,),
              Text('Bai dien thuyet', style: TextStyle(fontSize: 32.sp),)]),
      )),
    );
  }
}

class IconInforWidget extends StatelessWidget {
  const IconInforWidget({Key? key, required this.content, required this.icon})
      : super(key: key);

  final String? content;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: const Color(0xffE2E8ED)),
          child: Icon(
            icon,
            color: const Color(0xff0F2851),
            size: 24.r,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          content ?? '',
          style: TextStyle(color: const Color(0xff0F2851), fontSize: 24.sp),
        ),
      ],
    );
  }
}
