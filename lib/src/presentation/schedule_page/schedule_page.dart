import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/presentation/schedule_page/schedule_controller.dart';
import 'package:event_app/src/presentation/schedule_page/widget/day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends GetView<ScheduleController> {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Th 8, 2022',
            style: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xff0F2851),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          Obx(
            () => TableCalendar(
              focusedDay: controller.currentDate.value,
              firstDay: controller.firstDate,
              calendarFormat: CalendarFormat.week,
              locale: 'Vi_vn',
              headerVisible: false,
              daysOfWeekVisible: false,
              daysOfWeekHeight: 70.h,
              lastDay: controller.lstDate,
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) => DayWidget(
                  day: day,
                ),
                selectedBuilder: (context, day, focusedDay) => DayWidget(
                  day: day,
                  backgoundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
                todayBuilder: (context, day, focusedDay) => DayWidget(
                  day: day,
                  textColor: const Color(0xff6B779A),
                  backgoundColor:
                      Theme.of(context).primaryColor.withOpacity(0.05),
                ),
                headerTitleBuilder: (context, day) => Text(
                  '${day.month}/${day.year}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) =>
                  controller.onDaySelected(selectedDay, focusedDay),
              selectedDayPredicate: (day) {
                return isSameDay(controller.selectedDay.value, day);
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Thu 3, 14/07/2020',
            style: TextStyle(
              color: const Color(0xff0F2851),
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) => ItemSchedularCardWidget())))
        ]),
      ),    
    );
  }
}

class ItemSchedularCardWidget extends StatelessWidget {
  const ItemSchedularCardWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 12.h),
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
              border: Border.all(color: Color(0xFF0F2851).withOpacity(0.5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gap mat giao luu',
                style: TextStyle(
                    color: Color(0xff0F2851),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Sanh A khu nghi duong ABC',
                style: TextStyle(fontSize: 16.sp, color: const Color(0xff8696BB)),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: ((context, index) => InternetImageWidget(
                        padding: EdgeInsets.only(right: 8.w), imgUrl: null))),
              ),
              Divider(
                height: 32.h,
                color: const Color(0xff0F2851).withOpacity(0.3),
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: const Color(0xff8696BB),
                    size: 24.sp,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '11:00 AM - 12:00 AM (2 gio)',
                    style:
                        TextStyle(color: const Color(0xff8696BB), fontSize: 16.r),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
