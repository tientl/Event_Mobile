import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/row_infor_with_icon_widget.dart';
import 'package:event_app/src/presentation/list_user_page/widget/user_card_widget.dart';
import 'package:event_app/src/presentation/presentation_detail_page/presentation_detail_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PresentationDetailPage extends GetView<PresentstionDetailController> {
  const PresentationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: controller.presentation.value?.name ?? 'Chưa có tên',
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Bài diễn thuyết',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          SizedBox(
            height: 20.h,
          ),
          RowInfoWithIconWidget(
              content: '${controller.totalHour.value.toString()} giờ',
              iconData: Icons.calendar_today),
          RowInfoWithIconWidget(
              content: controller.location.value, iconData: Icons.location_on),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Mô tả',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            controller.presentation.value?.desc ?? 'Chưa có mô tả chi tiết',
            style: TextStyle(fontSize: 18.sp, color: const Color(0xff8A96BC)),
          ),
          SizedBox(height: 20.h,),
          Text(
            'Diễn giả',
            style: TextStyle(fontSize: 24.sp, color: const Color(0xff0F2851)),
          ),
          SizedBox(
            height: 12.h,
          ),
           controller.presentation.value?.speaker != null ?
           Column(
            children: controller.presentation.value!.speaker!
                .map((e) => UserCardWidget(registration: e))
                .toList(),
          ): const SizedBox()
        ]),
      )),
    );
  }
}
