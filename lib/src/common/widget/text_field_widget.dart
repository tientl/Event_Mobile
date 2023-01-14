import 'package:event_app/src/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      this.controller,
      this.hintText,
      this.lable,
      this.maxLine,
      this.enabled})
      : super(key: key);

  final String? lable;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLine;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lable != null
            ? Text(
                lable!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Theme.of(context).dividerColor),
              )
            : const SizedBox(),
        SizedBox(
          height: 12.h,
        ),
        TextField(
          maxLines: maxLine,
          controller: controller,
          enabled: enabled,
          decoration: CommonStyle.containerTextFieldStyle(
              context: context, hintText: hintText),
        )
      ],
    );
  }
}
