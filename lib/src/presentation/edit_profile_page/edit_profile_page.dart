import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/presentation/edit_profile_page/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Chỉnh sửa hồ sơ',
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              InternetImageWidget(
                imgUrl: controller.currentUser?.avatarUrl,
                width: 140.r,
                height: 140.r,
                borderRadius: 100.r,
              ),
              SizedBox(
                height: 40.h,
              ),
              EditProfileWidget(
                title: 'Họ và tên',
                content: controller.currentUser?.fullName ?? '-',
                onPress: () => editFullName(context),
              ),
              EditProfileWidget(
                title: 'Tên đăng nhập',
                content: controller.currentUser?.userName ?? '-',
                onPress: () => editUserName(context),
              ),
              EditProfileWidget(
                title: 'Số điện thoại',
                content: controller.currentUser?.mobile ?? '-',
                onPress: () => editPhone(context),
              ),
              EditProfileWidget(
                title: 'Email',
                content: controller.currentUser?.email ?? '-',
                onPress: () => editEmail(context),
              ),
            ],
          )),
    );
  }

  Future<dynamic> editPhone(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              scrollable: true,
              title: Column(
                children: [
                  Text(
                    'Đổi số điện thoại',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff0F2851),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Số điện thoại đang sử dụng và hoạt động bình thường',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff8A96BC), fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: controller.formKeyUserName,
                    child: TextFormField(
                      validator: (value) => controller.onValidRating(value),
                      controller: controller.userNamaeController,
                      decoration: InputDecoration(
                          hintText: 'Nhập số điện thoại',
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonWidget(
                    lable: 'Xác nhận',
                    borderRadius: BorderRadius.circular(8.r),
                    onPressed: () => {},
                  )
                ],
              ),
            ));
  }

  Future<dynamic> editEmail(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              scrollable: true,
              title: Column(
                children: [
                  Text(
                    'Đổi email',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff0F2851),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Email đang sử dụng và hoạt động bình thường',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff8A96BC), fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: controller.formKeyUserName,
                    child: TextFormField(
                      validator: (value) => controller.onValidRating(value),
                      controller: controller.userNamaeController,
                      decoration: InputDecoration(
                          hintText: 'Nhập email',
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonWidget(
                    lable: 'Xác nhận',
                    borderRadius: BorderRadius.circular(8.r),
                    onPressed: () => {},
                  )
                ],
              ),
            ));
  }

  Future<dynamic> editFullName(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              scrollable: true,
              title: Column(
                children: [
                  Text(
                    'Đổi họ và tên',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff0F2851),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Họ và tên đầy đủ của bạn',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff8A96BC), fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: controller.formKeyUserName,
                    child: TextFormField(
                      validator: (value) => controller.onValidRating(value),
                      controller: controller.userNamaeController,
                      decoration: InputDecoration(
                          hintText: 'Nhập họ và tên',
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonWidget(
                    lable: 'Xác nhận',
                    borderRadius: BorderRadius.circular(8.r),
                    onPressed: () => {},
                  )
                ],
              ),
            ));
  }

  Future<dynamic> editUserName(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              scrollable: true,
              title: Column(
                children: [
                  Text(
                    'Đổi tên đăng nhập',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff0F2851),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Tên đăng nhập nên ngắn gọn, dễ nhớ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff8A96BC), fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: controller.formKeyUserName,
                    child: TextFormField(
                      validator: (value) => controller.onValidRating(value),
                      controller: controller.userNamaeController,
                      decoration: InputDecoration(
                          hintText: 'Nhập tên đăng nhập',
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonWidget(
                    lable: 'Xác nhận',
                    borderRadius: BorderRadius.circular(8.r),
                    onPressed: () => {},
                  )
                ],
              ),
            ));
  }
}

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget(
      {Key? key,
      required this.content,
      required this.onPress,
      required this.title})
      : super(key: key);

  final String title;
  final String content;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border(
                bottom: BorderSide(
                    width: 1.h, color: Colors.grey.withOpacity(0.2)))),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '$title\n\n',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: content, style: Theme.of(context).textTheme.headline6)
            ])),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Theme.of(context).dividerColor.withOpacity(0.2)),
              child: Icon(
                Icons.edit,
                size: 20.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
