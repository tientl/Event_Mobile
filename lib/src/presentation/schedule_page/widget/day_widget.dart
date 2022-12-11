import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/data/model/entry/date_widget_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key, this.groupValue, required this.value, this.onTap})
      : super(key: key);
  DateWidgetEntry get dateWidgetEntry => DateWidgetEntry(value: value);
  bool get isSelected => value == groupValue;
  final DateTime value;
  final DateTime? groupValue;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        width: AppConstant.width / 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              dateWidgetEntry.date,
              style: TextStyle(
                  fontSize: 26.sp,
                  color: isSelected ? Colors.white : const Color(0xff6B779A),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              dateWidgetEntry.weekDate,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: isSelected ? Colors.white : const Color(0xff6B779A),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}