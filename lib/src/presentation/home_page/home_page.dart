import 'package:event_app/src/presentation/home_page/home_controller.dart';
import 'package:event_app/utilities/constants.dart';
import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event App'),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Sự kiện của tôi',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          Card(
            elevation: 3,
            child: Row(children: const []),
          )
        ],
      )),
    );
  }
}
