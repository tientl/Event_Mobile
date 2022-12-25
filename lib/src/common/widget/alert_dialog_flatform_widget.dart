import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlertDialogFlatform extends StatelessWidget {
  const AlertDialogFlatform(
      {Key? key,
      required this.cancelActionText,
      required this.content,
      required this.defaultActionText,
      required this.onConfirm,
      required this.title})
      : super(key: key);

  final String title;
  final String content;
  final String? cancelActionText;
  final String defaultActionText;
  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.r),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.r),
              bottomLeft: Radius.circular(50.r))),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                content,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: ButtonWidget(
                        lable: defaultActionText,
                        backgroundColor: Theme.of(context).indicatorColor,
                        onPressed: () => onConfirm(),
                      )),
                  SizedBox(
                    width: 20.w,
                  ),
                  if (cancelActionText != null)
                    Flexible(
                        flex: 1,
                        child: ButtonWidget(
                          lable: cancelActionText!,
                          backgroundColor: Theme.of(context).primaryColor,
                          onPressed: () => Navigator.of(context).pop(),
                        ))
                ],
              )
            ]),
      ),
    );
  }

  static void show(
      {required BuildContext context,
      required String title,
      required String content,
      required void Function() onConfirm,
      String? defaultActionText,
      String? cancelActionText}) {
    GetPlatform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              content: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              actions: <Widget>[
                if (cancelActionText != null)
                  CupertinoDialogAction(
                    child: Text(cancelActionText),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                CupertinoDialogAction(
                  child: Text(defaultActionText ?? 'Đồng ý'.tr),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onConfirm();
                  },
                ),
              ],
            ),
          )
        : showDialog(
            context: context,
            builder: (context) => AlertDialogFlatform(
                  cancelActionText: cancelActionText ?? 'cancel'.tr,
                  content: content,
                  defaultActionText: defaultActionText ?? 'ok'.tr,
                  title: title,
                  onConfirm: () => onConfirm(),
                ));
  }
}
