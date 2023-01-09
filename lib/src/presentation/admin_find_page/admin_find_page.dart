import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/data/model/registration.dart';
import 'package:event_app/src/presentation/admin_find_page/admin_find_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';

import 'package:get/get.dart';

class AdminFindPage extends GetView<AdminFindController> {
  const AdminFindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Tìm kiếm',
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Tên người tham gia',
                      style: TextStyle(
                          fontSize: 13.sp, color: const Color(0xff9BA6B0)),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: controller.nameController,
                      decoration: InputDecoration(
                          hintText: 'Nhập tên người tham gia',
                          hintStyle: TextStyle(
                              fontSize: 14.sp, color: const Color(0xff8A96BC)),
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
                      height: 32.h,
                    ),
                    ButtonWidget(
                      lable: 'Tìm kiếm',
                      onPressed: controller.onFind,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Kết quả tìm kiếm',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xff273341),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.registationsResult.length,
                    itemBuilder: ((context, index) => SearchResultWidget(
                        user: controller.registationsResult[index]))),
              )
            ],
          )),
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key, required this.user}) : super(key: key);

  final Registration user;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: const Color(0xffEBEBEB))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: '${user.name}    \n\nCông ty ${user.company}        ',
                style: TextStyle(
                    color: const Color(0xff273341),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '${user.function}',
                style: TextStyle(
                  color: const Color(0xff9BA6B0),
                  fontSize: 15.sp,
                ),
              )
            ])),
            Text(
              '${user.id}',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            )
          ],
        ),
        Divider(
          height: 32.h,
          color: const Color(0xffEBEBEB),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Thời gian check-in\n\n',
                  style: TextStyle(
                      color: const Color(0xff405062),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: user.checkIntime?.hhmmddmmyyyy ?? '-',
                  style: TextStyle(
                    color: const Color(0xff9BA6B0),
                    fontSize: 16.sp,
                  )),
            ])),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Checkin bởi\n\n',
                  style: TextStyle(
                      color: const Color(0xff405062),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: user.checkIntime != null ? 'Admin' : '-',
                  style: TextStyle(
                    color: const Color(0xff9BA6B0),
                    fontSize: 16.sp,
                  )),
            ]))
          ],
        )
      ]),
    );
  }
}
