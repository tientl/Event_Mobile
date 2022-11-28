import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget(
      {Key? key,this.padding, this.onPressed})
      : super(key: key);

  final EdgeInsets? padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8.r),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Color(0xff5A75A7)),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).indicatorColor.withOpacity(0.2),
                      offset: const Offset(0, 0),
                      blurRadius: 4.r,
                      spreadRadius: 0.r)
                ],
                color: Colors.white),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InternetImageWidget(
                    imgUrl:null,
                    borderRadius:16.r,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nguyen Van A',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                       'Cty IntesCo',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                       'Nhan vien',
                        style: TextStyle(
                          color: Color(0xff677294), fontSize: 14.sp),
                      ),

                    ],
                  )
                ],
              ),
              Divider(
                height: 36.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 24.r,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                       '0348556974',
                        style:TextStyle(
                          color: Color(0xff677294), fontSize: 14.sp),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 24.r,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'tienlt@gmail.com',
                        style: TextStyle(
                          color: Color(0xff677294), fontSize: 14.sp),
                      )
                    ],
                  )
                ],
              ),
            
            ]),
          )
        ],
      ),
    );
  }
}
