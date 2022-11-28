import 'package:event_app/src/common/utils/util_datetime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayWidget extends StatelessWidget {
  const DayWidget(
      {Key? key, required this.day, this.backgoundColor, this.textColor})
      : super(key: key);

  final DateTime day;
  final Color? backgoundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      padding: EdgeInsets.only(top: 4.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
             color: backgoundColor ?? Colors.white),
      child: Column(children: [
        Text(
          day.day.toString(),
          style:
              Theme.of(context).textTheme.bodyText1?.copyWith(color: textColor ?? Colors.black),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          day.weekDayString,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color:textColor ?? Colors.black),
        )
      ]),
    );
  }
}
