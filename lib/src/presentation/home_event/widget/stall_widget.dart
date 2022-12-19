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
        child: SizedBox(
          height: 132.h,
          child: Column(
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
              SizedBox(height: 16.h,),
               Text(stall.desc ?? 'Chưa có mô tả',
                          style: TextStyle(fontSize: 16.sp, color: const Color(0xff424347))),
            ],
          ),
        ),
      ),
    );
  }
}
