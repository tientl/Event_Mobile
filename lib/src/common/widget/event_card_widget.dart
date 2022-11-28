import 'package:event_app/src/common/widget/button_widget.dart';
import 'package:event_app/src/common/widget/internet_image_widget.dart';
import 'package:event_app/src/data/model/event.dart';
import 'package:flutter/material.dart';
import 'package:event_app/src/common/utils/util_datetime.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.event, this.padding, this.onPressed})
      : super(key: key);

  final Event event;
  final EdgeInsets? padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xff5A75A7)),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).indicatorColor.withOpacity(0.2),
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 0)
                ],
                color: Colors.white),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InternetImageWidget(
                    imgUrl: event.urlImage,
                    borderRadius: 16,
                  ),
                   SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.name ?? '',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: const Color.fromARGB(236, 4, 37, 87)),
                        ),
                        const SizedBox(
                          height: 8,
                        ), Text(
                            event.company ?? '',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 2, 2, 2)),
                        
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                height: 36,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 20,
                  ),
                   SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '${event.dateStart?.hhmmddmmyyyy} - ${event.dateEnd?.hhmmddmmyyyy}',
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 10, 77, 1)),
                  ),
                ],
              ),
              
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                lable: event.isComfirm ? 'Xem chi tiết' : 'Xác nhận tham gia',
                borderRadius: BorderRadius.circular(8),
                lableColor: Colors.white,
                onPressed: onPressed,
              )
            ]),
          )
        ],
      ),
    );
  }
}
