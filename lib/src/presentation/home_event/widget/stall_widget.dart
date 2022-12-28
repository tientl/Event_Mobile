import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/data/model/stall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StallWidget extends StatelessWidget {
  const StallWidget({Key? key, this.onTap, required this.stall})
      : super(key: key);
  final void Function()? onTap;
  final Stall stall;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Container(
           width: AppConstant.width - 100.w,
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3),
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                blurRadius: 5),
            BoxShadow(
                offset: const Offset(3, 3),
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                blurRadius: 5),
            BoxShadow(
                offset: const Offset(3, 0),
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                blurRadius: 5)
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 88.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InternetImageWidget(
                      imgUrl: stall.imgUrl,
                      borderRadius: 12.r,
                      width: 88.w,
                      height: 88.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (stall.name ?? '').toUpperCase(),
                            style: TextStyle(
                                color: const Color(0xff424347),
                                fontSize: 16.r,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            '${stall.company ?? '-'} | ${stall.level ?? '-'} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: Theme.of(context).hintColor),
                          ),
                         const Spacer(),
                          Text(stall.email ?? '-',
                              style: TextStyle(fontSize: 16.sp, color: const Color(0xff424347))),
                          SizedBox(
                            height: 4.h,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h,),
               Text( (stall.desc == null || stall.desc!.isEmpty) ?  'Chưa có mô tả' : stall.desc!,
                          style: TextStyle(fontSize: 16.sp, color: const Color(0xff424347))),
              SizedBox(height: 12.h,)
            ],
          ),
        ),
      ),
    );
  }
}
