import 'package:event_app/src/common/widget/app_bar_widget.dart';
import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/common/widget/text_field_widget.dart';
import 'package:event_app/src/presentation/choice_service_page/choice_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChoiceServicePage extends GetView<ChoiceServiceControlller> {
  const ChoiceServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Chọn dịch vụ'.tr,
        titleStyle: Theme.of(context).textTheme.bodyText1,
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 30.h),
        child: ButtonWidget(
          lable: 'Tiếp tục'.tr,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          onPressed: () => {},
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Chọn các dịch vụ bạn cần'.tr,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12.h,
          ),
          Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.services.length,
              itemBuilder: (context, index) => CheckBoxWidget(
                    value: controller.services[index].isChoice,
                    title: controller.services[index].name ?? '',
                    isEdit: controller.services[index].isEdit ?? false,
                    controller: controller.textController[index],
                    onChange: (p0) => controller.onChoiceService(index, p0),
                  )))
        ]),
      )),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    Key? key,
    required this.value,
    required this.title,
    this.controller,
    required this.isEdit,
    this.onChange,
  }) : super(key: key);

  final bool value;
  final bool isEdit;
  final TextEditingController? controller;
  final String title;
  final void Function(bool?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(value: value, onChanged: onChange),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 8.h,
              ),
              Visibility(
                visible: isEdit,
                child: TextFieldWidget(
                  hintText: 'Nhập thông tin',
                  controller: controller,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
