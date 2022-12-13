import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowInfoWithIconWidget extends StatelessWidget {
  const RowInfoWithIconWidget(
      {Key? key, required this.content, required this.iconData})
      : super(key: key);
  final String content;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffE2E8ED),
            child: Icon(
              iconData,
              size: 24.sp,
              color: const Color(0xff0F2851),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            content,
            style: TextStyle(fontSize: 16.sp, color: const Color(0xff0F2851)),
          )
        ],
      ),
    );
  }
}
