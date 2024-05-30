import 'package:erp_homepage/home_upcomingschedule/controller.dart';
import 'package:erp_homepage/home_upcomingschedule/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingSchedule extends GetView<ScheduleController> {
  const UpcomingSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  text: "Upcoming Schedule",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "\n30-05-24",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: controller.addEvent,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Container(
            height: 500,
            child: GetBuilder<ScheduleController>(builder: (value) {
              return ListView(
                children:
                    value.items.map((e) => ScheduleItemCard(item: e)).toList(),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ScheduleItemCard extends StatelessWidget {
  const ScheduleItemCard({super.key, required this.item});
  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(10),
                      bottomStart: Radius.circular(10))),
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 12,
                            ),
                            Text(
                              item.date,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.access_time,
                              size: 12,
                            ),
                            Text(
                              item.time,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(item.description),
                    Row(
                      children: [const Icon(Icons.person), Text(item.name)],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
