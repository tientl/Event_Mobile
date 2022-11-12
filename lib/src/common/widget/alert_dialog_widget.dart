import 'package:event_app/src/data/model/enum/type_of_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends StatelessWidget {
  final TypeOfDialog type;
  final String content;
  final String textButton;
  final List<Widget>? actions;
  final VoidCallback? onPressButton;
  final String? title;
  const AlertDialogWidget(
      {Key? key,
      this.type = TypeOfDialog.success,
      required this.content,
      required this.textButton,
      this.onPressButton,
      this.actions,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  type.iconPath,
                  height: 120,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  title ?? type.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: onPressButton,
                  style: type.getButtonStyle(context),
                  child: Text(
                    textButton,
                    style: TextStyle(color: type.getTextColor(context)),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  static void hideDialog() {
    if (Get.isDialogOpen == null) return;
    if (Get.isDialogOpen!) Get.back();
  }

  static void show(
      {bool? barrierDismissible,
      String? content,
      String? title,
      String? textButton,
      VoidCallback? onPress,
      TypeOfDialog? typeOfDialog}) {
    Get.dialog(
        barrierDismissible: barrierDismissible ?? true,
        AlertDialogWidget(
          title: title,
          content: content ?? 'systerm_error'.tr,
          textButton: textButton ?? 'confirm'.tr,
          onPressButton: onPress ?? Get.back,
          type: typeOfDialog ?? TypeOfDialog.error,
        ));
  }
}
