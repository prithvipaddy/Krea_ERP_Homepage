import 'dart:convert';
import 'dart:io';

import 'package:erp_homepage/home_upcomingschedule/modal.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  List<ScheduleItem> items = [
    const ScheduleItem(
        title: "title",
        date: "date",
        description: "description",
        name: "name",
        time: "time")
  ];

  getItems() async {
    String rawJson = await File("items.json").readAsString();
    for (Map<String, dynamic> i in jsonDecode(rawJson)) {
      items.add(ScheduleItem.fromJson(i));
    }
    update();
  }
}
// void readJson() async {
//     String rawJson = await File("resources/jsonformatter.txt").readAsString();
//     List<jsonCard> l1 = [];
//     List<jsonCard> all = [];
//     for (Map<String, dynamic> i in jsonDecode(rawJson)) {
//       all.add(jsonCard.fromJson(i));
//     }
//     for (jsonCard elem in all) {
//       if (elem.parent_id == 0) {
//         l1.add(elem);
//       }
//     }
//     setState(
//       () {
//         l1Cards = l1;
//         allCards = all;
//       },
//     );
//   }