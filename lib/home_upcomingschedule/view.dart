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
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          GetBuilder<ScheduleController>(builder: (value) {
            return ListView(
              children:
                  value.items.map((e) => ScheduleItemCard(item: e)).toList(),
            );
          }),
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
    return const Placeholder();
  }
}
