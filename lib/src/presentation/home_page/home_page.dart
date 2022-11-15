import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/common/widget/search_bar_widget.dart';
import 'package:event_app/src/presentation/home_page/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
        SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
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
              SearchBarWidget(onSuffixIconTap: () => {}),
              Card(
                elevation: 3,
                child: Column(mainAxisSize: MainAxisSize.min, children: const [
                  ListTile(
                    leading: Icon(Icons.event),
                    title: Text('Tên Event'),
                    subtitle: Text('Thời gian - Địa chỉ hoặc tên cty'),
                  )
                ]),
              )
            ],
          ),
        )),
      ]),
    );
  }
}
