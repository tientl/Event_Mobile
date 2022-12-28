import 'package:event_app/src/common/style.dart';
import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:event_app/src/presentation/choice_event_page/choice_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ChoiceEventPage extends GetView<ChoiceEventController> {
  const ChoiceEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Chọn sự kiện'.tr,
        titleStyle: Theme.of(context).textTheme.bodyText1,
      ),
      bottomSheet: Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 30.h),
        child: ButtonWidget(
          lable: 'Tiếp tục'.tr,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          onPressed: controller.onNavigateToChooseDependedAppointment,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            'Vui lòng chọn sự kiện'.tr,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Theme.of(context).canvasColor),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputDecorator(
                decoration: CommonStyle.outlineDropdownButton(
                    context: context, lable: ''.tr),
                child: Obx(
                  () => Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Theme.of(context).backgroundColor),
                    child: DropdownButton<Event>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      borderRadius: BorderRadius.circular(10.w),
                      value: controller.currentEvent.value,
                      items: controller.events
                          .map<DropdownMenuItem<Event>>((event) =>
                              DropdownMenuItem(
                                value: event,
                                child: Text(event.name ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyText2),
                              ))
                          .toList(),
                      onChanged: (Event? event) =>
                          controller.onServiceChange(event),
                      hint: Text(
                        'event'.tr,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                )),
          ),
       
        ]),
      )),
    );
  }
}