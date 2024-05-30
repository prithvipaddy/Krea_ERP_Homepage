import 'dart:convert';
import 'dart:io';

import 'package:erp_homepage/home_upcomingschedule/modal.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  List<ScheduleItem> items = [];
  @override
  void onInit() async {
    super.onInit();
    items.clear();
    String rawJson = await File("resources/HomepageUpcomingScheduleItems.json")
        .readAsString();
    for (Map<String, dynamic> i in jsonDecode(rawJson)) {
      items.add(ScheduleItem.fromJson(i));
    }
    update();
  }

  void addEvent() {
    items.add(ScheduleItem(
        title: "title",
        date: "date",
        description: "description",
        name: "name",
        time: "time"));
    update();
  }
}
