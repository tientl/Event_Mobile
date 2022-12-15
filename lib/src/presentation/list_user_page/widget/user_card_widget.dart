import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/data/model/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget(
      {Key? key, this.padding, this.onPressed, required this.registration})
      : super(key: key);

  final EdgeInsets? padding;
  final void Function()? onPressed;
  final Registration registration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8.r),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xff5A75A7)),
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
                    imgUrl: registration.urlImage ?? '',
                    height: 100,
                    width: 100,
                    borderRadius: 16.r,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h,),
                      Text(
                        registration.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      registration.company != null &&
                              registration.company!.isNotEmpty
                          ? Text(
                              registration.company ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        registration.function ?? '',
                        style: TextStyle(
                            color: const Color(0xff677294), fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      if( registration.mobile?.isNotEmpty ?? false)
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            registration.mobile ?? '',
                            style: TextStyle(
                                color: const Color(0xff677294),
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),   if( registration.email?.isNotEmpty ?? false)
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 16.r,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            registration.email ?? '',
                            style: TextStyle(
                                color: const Color(0xff677294),
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
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
