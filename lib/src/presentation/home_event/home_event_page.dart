import 'dart:ui';

import 'package:event_app/src/app/app_config/app_constant.dart';
import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/data/model/registration.dart';
import 'package:event_app/src/data/model/sponsor.dart';
import 'package:event_app/src/presentation/home_event/home_event_controller.dart';
import 'package:event_app/src/presentation/home_event/widget/stall_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';

class HomeEventPage extends GetView<HomeEventController> {
  const HomeEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Wrap(
                  children: [
                    InternetImageWidget(
                      borderRadius: 0,
                      imgUrl: controller.currentEvent.value?.eventImage,
                      width: Get.width,
                      height: Get.height / 3,
                    ),
                    SizedBox(
                      height: 100.h,
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 12.h),
                          width: AppConstant.width,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.currentEvent.value?.name ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  ' ${controller.currentEvent.value!.dateStart?.ddmmyyyy} - ${controller.currentEvent.value?.dateEnd?.ddmmyyyy}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  ' ${controller.currentEvent.value?.address}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                ),
                              ]),
                        ),
                      ),
                    ))
              ]),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nhà tài trợ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () =>
                                controller.onNavigateToListSponsor(),
                            child: Text(
                              'Xem tất cả',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 88.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.currentEvent.value?.sponsor?.length ?? 0,
                        itemBuilder: (context, index) => SponsorCardWidget(
                          sponsor:
                              controller.currentEvent.value!.sponsor![index],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text('Giới thiệu',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.black,
                            )),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                        controller.currentEvent.value?.description ??
                            'Chưa có thông tin giới thiệu',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.grey,
                            )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.r),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.14)),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  '${controller.currentEvent.value?.registrations?.length} người tham gia',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: const Color.fromARGB(
                                              255, 24, 39, 66)),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: Theme.of(context).primaryColor),
                              child: IconButton(
                                  color: Colors.white,
                                  iconSize: 16.r,
                                  constraints: const BoxConstraints(),
                                  onPressed: () => controller
                                      .onNavigateToListResgistration(),
                                  icon: const Icon(Icons.arrow_forward_ios)),
                            ),
                          ]),
                    ), 
                    if (controller.currentEvent.value?.mapImage != null)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      width: AppConstant.width,
                      height: 160.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 16.h),
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InternetImageWidget(
                                padding: EdgeInsets.only(right: 12.w),
                                height: 160.h,
                                width: AppConstant.width / 2 - 10.w,
                                imgUrl:
                                    controller.currentEvent.value?.mapImage),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sơ đồ tổ chức sự kiện',
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        color: const Color(0xff0F2851),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: controller.onNavigateToPreviewImg,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.h),
                                      child: Text(
                                        'Xem ngay >>',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontStyle: FontStyle.italic,
                                                fontSize: 16.sp,
                                                color: const Color.fromARGB(
                                                    255, 24, 39, 66)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Diễn giả',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () =>
                                controller.onNavigateToListSpeaker(),
                            child: Text(
                              'Xem tất cả',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 108.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.currentEvent.value?.speakers?.length ??
                                0,
                        itemBuilder: (context, index) => SpeakerCardWidget(
                          speaker:
                              controller.currentEvent.value!.speakers![index],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.r),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.14)),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  'Đánh giá sự kiện',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: const Color.fromARGB(
                                              255, 24, 39, 66)),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: Theme.of(context).primaryColor),
                              child: IconButton(
                                  color: Colors.white,
                                  iconSize: 16.r,
                                  constraints: const BoxConstraints(),
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            scrollable: true,
                                            title: Column(
                                              children: [
                                                Text(
                                                  'Đánh giá sự kiện',
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      color: const Color(
                                                          0xff0F2851),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 12.h,
                                                ),
                                                Text(
                                                  'Vui lòng cho chúng tôi biết trải nghiệm của bạn',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff8A96BC),
                                                      fontSize: 14.sp),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                RatingBar.builder(
                                                  initialRating: 1,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemSize: 32.r,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 4.w),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 32.r,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    controller
                                                        .onRatingUpdate(rating);
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Form(
                                                  key: controller.formKey,
                                                  child: TextFormField(
                                                    validator: (value) =>
                                                        controller
                                                            .onValidRating(
                                                                value),
                                                    controller: controller
                                                        .ratingController,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            'Nhập đánh giá của bạn',
                                                        hintStyle: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: const Color(
                                                                0xff8A96BC)),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    12.r),
                                                            borderSide: BorderSide(
                                                                color: const Color(0xff0F2851)
                                                                    .withOpacity(
                                                                        0.2))),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    20.r),
                                                            borderSide: BorderSide(
                                                                color: const Color(0xff0F2851).withOpacity(0.2)))),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                ButtonWidget(
                                                  lable: 'Đánh giá',
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  onPressed:
                                                      controller.onRatingEvent,
                                                )
                                              ],
                                            ),
                                          )),
                                  icon: const Icon(FontAwesomeIcons.pen)),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    if (controller.listStall != null &&
                        controller.listStall!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gian hàng',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.listStall!.length,
                              itemBuilder: ((context, index) => StallWidget(
                                  stall: controller.listStall![index]))),
                        ],
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpeakerCardWidget extends StatelessWidget {
  final Registration speaker;
  const SpeakerCardWidget({
    Key? key,
    required this.speaker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        children: [
          InternetImageWidget(
            imgUrl: speaker.urlImage,
            borderRadius: 8.r,
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Text(
                speaker.name ?? 'Nguyễn Văn A',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                speaker.company ?? 'CEO in Intes',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SponsorCardWidget extends StatelessWidget {
  final Sponsor sponsor;
  const SponsorCardWidget({Key? key, required this.sponsor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.w),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InternetImageWidget(
            imgUrl: sponsor.urlImage ?? '',
            borderRadius: 100.r,
            height: 52.r,
            width: 52.r,
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sponsor.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'CEO in Intes',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
