import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/common/widget/row_infor_with_icon_widget.dart';
import 'package:event_app/src/data/model/presentation.dart';
import 'package:event_app/src/presentation/sub_schedule_page/sub_schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubSchedulePage extends GetView<SubScheduleController> {
  const SubSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Chi tiết',
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 20.h),
        child: ButtonWidget(
          lable: 'Đánh giá',
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    scrollable: true,
                    title: Column(
                      children: [
                        Text(
                          'Đánh giá sự kiện',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color(0xff0F2851),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Vui lòng cho chúng tôi biết trải nghiệm của bạn',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff8A96BC), fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 32.r,
                          itemPadding: const  EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) =>   Icon(
                            Icons.star,
                            color: Colors.amber,
                             size: 32.r,
                          ),
                          onRatingUpdate: (rating) {
                            controller.onRatingUpdate(rating);
                          },
                        ),
                        SizedBox(height: 20.h,),
                        TextField(
                          controller: controller.ratingController,
                          decoration: InputDecoration(
                              hintText: 'Nhập đánh giá của bạn',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff8A96BC)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                      color: const Color(0xff0F2851)
                                          .withOpacity(0.2))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                      color: const Color(0xff0F2851)
                                          .withOpacity(0.2)))),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ButtonWidget(
                          lable: 'Đánh giá',
                          borderRadius: BorderRadius.circular(8.r),
                          onPressed: controller.onClickRatingSubSchedule,
                        )
                      ],
                    ),
                  )),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            controller.subSchedule.value?.name ?? 'Chưa xác định',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            ' Được tổ chức bởi',
            style: TextStyle(fontSize: 16.sp, color: const Color(0xff8696BB)),
          ),
          SizedBox(
            height: 40.h,
          ),
          Obx(() => RowInfoWithIconWidget(
                iconData: Icons.calendar_today_rounded,
                content: controller.date.value,
              )),
          RowInfoWithIconWidget(
              content:
                  controller.subSchedule.value?.location ?? 'Chưa xác định',
              iconData: Icons.location_on),
          RowInfoWithIconWidget(
              content: controller.subSchedule.value?.beginEndTimeTotal ?? '-',
              iconData: Icons.timer),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Bài diễn thuyết',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          controller.subSchedule.value?.presentation != null
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    PresentationWidget(
                        onTap: () =>
                            controller.onNavigateToPresentationDetailPage(
                                controller.subSchedule.value!.presentation!),
                        present: controller.subSchedule.value!.presentation!)
                  ]),
                )
              : const SizedBox(),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Chi tiết lịch trình',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            controller.subSchedule.value?.detail ?? 'Chưa có lịch trình cụ thể',
            style: TextStyle(color: const Color(0xff8A96BC), fontSize: 16.sp),
          )
        ]),
      )),
    );
  }
}

class PresentationWidget extends StatelessWidget {
  const PresentationWidget({Key? key, required this.present, this.onTap})
      : super(key: key);
  final Presentation present;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.white,
            border: Border.all(color: const Color(0xff5A75A7))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            CircleAvatar(
              child: Image.asset('assets/images/default/file.png'),
            ),
            SizedBox(
              width: 20.w,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '${present.name}\n',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0F2851))),
              TextSpan(
                  text: '${present.id}',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff6B7280)))
            ]))
          ]),
          Divider(
            height: 40.h,
            color: const Color(0xff6B7280),
          ),
          Text(
            present.listSpeakerName,
            style: TextStyle(color: const Color(0xff0F75BD), fontSize: 16.sp),
          )
        ]),
      ),
    );
  }
}
