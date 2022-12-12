import 'package:event_app/src/presentation/schedule_page/schedule_controller.dart';
import 'package:event_app/src/presentation/schedule_page/widget/day_widget.dart';
import 'package:event_app/src/presentation/schedule_page/widget/item_schedular_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';

class SchedulePage extends GetView<ScheduleController> {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Tháng ${controller.currentDate.value?.mmyyyy ?? ''}',
            style: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xff0F2851),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.listDate
                      .map((element) => DateWidget(
                            value: element,
                            groupValue: controller.currentDate.value,
                            onTap: () => controller.onChangeDate(element),
                          ))
                      .toList(),
                ),
              )),
          SizedBox(
            height: 28.h,
          ),
          Obx(() => Text(
                controller.currentDate.value?.weekDateAndDate ?? '',
                style: TextStyle(
                  color: const Color(0xff0F2851),
                  fontSize: 24.sp,
                ),
              )),
          SizedBox(
            height: 20.h,
          ),
          Obx(() => Expanded(
              child: ListView.builder(
                  itemCount: controller.currentListSubSchedule.length,
                  itemBuilder: ((context, index) => ItemSchedularCardWidget(
                    onTap: () => controller.onNavigateToSubSchedulePage(controller.currentListSubSchedule[index]),
                        subschedular: controller.currentListSubSchedule[index],
                      )))))
        ]),
      ),
    );
  }
}



