import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/common/widget/event_card_widget.dart';
import 'package:event_app/src/common/widget/search_bar_widget.dart';
import 'package:event_app/src/presentation/home_page/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF61A4F1),
                Color.fromARGB(255, 135, 184, 243),
                Color.fromARGB(255, 160, 196, 236),
                Color(0xFFBCD0F5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sự kiện của tôi',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                    const InternetImageWidget(
                      imgUrl: null,
                      borderRadius: 100,
                      width: 35,
                      height: 35,
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SearchBarWidget(
                  controller: controller.searchController,
                  onSuffixIconTap: () => {},
                  hint: 'Nhập tên sự kiện',
                  onChanged: controller.onChangeSearch,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 48,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Obx(
                                  () => TabBar(
                                      padding: EdgeInsets.zero,
                                      labelStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                      labelColor: Colors.white,
                                      labelPadding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      unselectedLabelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .canvasColor),
                                      indicator: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                          color: const Color.fromARGB(
                                              255, 3, 82, 119)),
                                      unselectedLabelColor: Colors.blueGrey,
                                      controller: controller.tabController,
                                      tabs: [
                                        Tab(
                                            text:
                                                'Đã xác nhận (${controller.listEventConfirm.length})'),
                                        Tab(
                                          text:
                                              'Chưa xác nhận (${controller.listEventUnconfirm.length})',
                                        ),
                                      ]),
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: TabBarView(
                                controller: controller.tabController,
                                children: [
                                  Obx(
                                    () => ListView.builder(
                                        itemCount:
                                            controller.listEventConfirm.length,
                                        itemBuilder: (context, index) =>
                                            EventCard(
                                              onPressed: () => controller
                                                  .onNavigateEventRootApp(
                                                      controller
                                                              .listEventConfirm[
                                                          index]),
                                              event: controller
                                                  .listEventConfirm[index],
                                            )),
                                  ),
                                  Obx(() => ListView.builder(
                                      itemCount:
                                          controller.listEventUnconfirm.length,
                                      itemBuilder: (context, index) =>
                                          EventCard(
                                            onPressed: () => showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  title: const Text(
                                                    "Thông báo",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF398AE5),
                                                    ),
                                                  ),
                                                  content: const Text(
                                                      "Bạn có chắc chắn muốn tham gia sự kiện"),
                                                  actions: [
                                                    TextButton(
                                                        child: const Text("OK"),
                                                        onPressed: () {
                                                          controller
                                                              .onConfirmEvent(
                                                                  index);
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                    TextButton(
                                                        onPressed: (() =>
                                                            Navigator.pop(
                                                                context)),
                                                        child:
                                                            const Text("Hủy")),
                                                  ],
                                                );
                                              },
                                            ),
                                            event: controller
                                                .listEventUnconfirm[index],
                                          )))
                                ]),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
