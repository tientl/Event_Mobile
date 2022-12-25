import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingOptionWidget extends StatelessWidget {
  const SettingOptionWidget(
      {Key? key,
      this.color,
      this.suffix,
      this.padding,
      this.onTap,
      this.pre,
      this.icon,
      this.lable,
      required this.title})
      : super(key: key);

  final IconData? icon;
  final String? lable;
  final Widget title;
  final Color? color;
  final Widget? suffix;
  final Widget? pre;
  final EdgeInsets? padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.only(bottom: 20.h, left: 12.w),
        child: Row(
          children: [
            pre ??
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: color?.withOpacity(0.2)),
                  child: Icon(icon, size: 24.r, color: color),
                ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(flex: 1, child: title),
            Text(
              lable ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Theme.of(context).dividerColor),
            ),
            SizedBox(
              width: 12.w,
            ),
            suffix ??
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Theme.of(context).dividerColor.withOpacity(0.2)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.r,
                  ),
                )
          ],
        ),
      ),
    );
  }
}
