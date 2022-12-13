import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/data/model/sub_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';

class ItemSchedularCardWidget extends StatelessWidget {
  const ItemSchedularCardWidget(
      {Key? key, this.onTap, required this.subschedular})
      : super(key: key);
  final SubSchedule subschedular;
  bool  get isHappened => subschedular.timeScheduler == null ? true: subschedular.timeScheduler!.compareTo(DateTime.now())  < 0;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
              border: Border.all(color:const Color(0xFF0F2851).withOpacity(0.5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      subschedular.name ?? 'Không có tên',
                      style: TextStyle(
                          color:const Color(0xff0F2851),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                 Visibility(
                  visible: isHappened,
                  child: const  Chip( padding: EdgeInsets.zero, label: Text('Đã diễn ra')))
                ],
              ),
        
              Text(
                subschedular.location ?? 'Chưa cập nhật địa điểm',
                style:
                    TextStyle(fontSize: 16.sp, color: const Color(0xff8696BB)),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: subschedular.presentation?.speaker?.length ?? 0,
                    itemBuilder: ((context, index) => InternetImageWidget(
                        padding: EdgeInsets.only(right: 8.w), imgUrl: subschedular.presentation?.speaker?[index].urlImage))),
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
                    '${subschedular.hourStart?.hhmm ?? "00:00"} - ${subschedular.hourEnd?.hhmm ?? '00:00'} (${subschedular.totalHour} giờ)',
                    style: TextStyle(
                        color: const Color(0xff8696BB), fontSize: 16.r),
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
