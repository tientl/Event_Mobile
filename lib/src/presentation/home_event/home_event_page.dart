import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/data/model/speaker.dart';
import 'package:event_app/src/data/model/sponsor.dart';
import 'package:event_app/src/presentation/home_event/home_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    bottom: 10,
                    child: Wrap(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          width: Get.width - 40.w,
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.currentEvent.value?.name ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  '${controller.currentEvent.value!.dateStart?.ddmmyyyy} - ${controller.currentEvent.value?.dateEnd?.ddmmyyyy}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  controller.currentEvent.value?.address ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ]),
                        ),
                      ),
                    ]))
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
                      height: 68.h,
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
                      height: 12.h,
                    ),
                    Text('Giới thiệu',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.black,
                            )),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(controller.currentEvent.value?.description ?? '',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.grey,
                            )),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.grey.withOpacity(0.2)),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: Colors.grey.withOpacity(0.5)),
                                  child: Text(
                                      controller.currentEvent.value
                                              ?.registrations?.length
                                              .toString() ??
                                          '0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            color: Colors.black,
                                          )),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  'Người tham gia',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: Theme.of(context).primaryColor),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () => controller
                                      .onNavigateToListResgistration(),
                                  icon: const Icon(Icons.arrow_forward_ios)),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 8.h,
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
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => SpeakerCardWidget(),
                      ),
                    ),
                    SizedBox(height: 20.h)
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
  final Speaker speaker;
  const SpeakerCardWidget({
    Key? key,
    required this.speaker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          InternetImageWidget(
            imgUrl:
                'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            borderRadius: 8.r,
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nguyen Van A',
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
          ),
          SizedBox(
            height: 20.h,
          )
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
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
