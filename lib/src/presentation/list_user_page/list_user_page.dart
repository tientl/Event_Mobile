import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/presentation/list_user_page/widget/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListUserPage extends StatelessWidget {
  const ListUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Danh sách diễn giả',
        titleStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color.fromARGB(236, 4, 37, 87),
            ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => UserCardWidget() ) ,
      ),
    );
  }
}