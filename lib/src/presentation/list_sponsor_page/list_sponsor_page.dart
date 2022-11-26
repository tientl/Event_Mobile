import 'package:event_app/src/app/app_config/app_color.dart';
import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListSponsorPage extends StatelessWidget {
  const ListSponsorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Danh sách nhà tài trợ',
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => const SponsorCardWidget() ) ,
      ),
    );
  }
}

class SponsorCardWidget extends StatelessWidget {
  const SponsorCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff5A75A7)),
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).indicatorColor.withOpacity(0.2),
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 0)
            ]),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InternetImageWidget(
                imgUrl: null,
                borderRadius: 12.r,
                height: 100.r,
                width: 100.r,
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyen Trang',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text('Cty IntesCo',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'https://www.behance.net/gallery',
                      style: TextStyle(
                          color: Color(0xff677294), fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8.r,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              'Hien vat',
                              style: TextStyle(
                                  color: Color(0xff677294), fontSize: 14.sp),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 8.r,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  'Nha tai tro vang',
                                  style: TextStyle(
                                      color: Color(0xff677294),
                                      fontSize: 14.sp),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(height: 40.h, color: Color(0xffF5F5F5)),
          Text(
            'Giet duoc giet luon',
            style: TextStyle(color: Color(0xff677294), fontSize: 18.sp),
          ),
            Divider(height: 40.h, color: Color(0xffF5F5F5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 24.r,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                     '0348771036',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: AppColors.kFF6B779A),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 24.r,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'tienlt@gmail.com',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: AppColors.kFF6B779A),
                    )
                  ],
                )
              ],
            ),
        ]),
      ),
    );
  }
}
