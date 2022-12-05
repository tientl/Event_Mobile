import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/presentation/list_user_page/list_user_controller.dart';
import 'package:event_app/src/presentation/list_user_page/widget/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListUserPage extends GetView<ListUserController> {
  const ListUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Danh sách người tham gia',
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
            itemCount: controller.currentListResgistration.length,
            itemBuilder: (context, index) => UserCardWidget(
                  registration: controller.currentListResgistration[index],
                )),
      ),
    );
  }
}
