import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {Key? key,
      this.actions = const [],
      this.title,
      this.titleStyle,
      this.backgroundcolor,
      this.bottom,
      this.leading,
      this.iconColor,
      this.preferredSizeCustom})
      : super(key: key);
  @override
  Size get preferredSize {
    return preferredSizeCustom ?? Size.fromHeight(56.h);
  }

  final String? title;
  final TextStyle? titleStyle;
  final List<Widget> actions;
  final Color? backgroundcolor;
  final Size? preferredSizeCustom;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme:
          IconThemeData(color: iconColor ?? Theme.of(context).indicatorColor),
      backgroundColor: backgroundcolor ?? Theme.of(context).primaryColor,
      elevation: 0,
      title: Text(
        title ?? "",
        style: titleStyle ??
            Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Theme.of(context).backgroundColor,
                ),
      ),
      centerTitle: true,
      leading: leading ??
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20.r,
            ),
            splashRadius: 20.r,
          ),
      actions: actions,
      bottom: bottom,
    );
  }
}
