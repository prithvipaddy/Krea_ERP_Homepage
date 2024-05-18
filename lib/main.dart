// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
// import 'icons.dart';

void main() {
  runApp(const MainApp());
}

typedef IndexCallBack = void Function(int index);
typedef BoolCallBack = void Function(bool val);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: jsonSidebar(),
    );
  }
}

class jsonCard {
  final int parent_id;
  final String resource_icon;
  final int resource_id;
  final String resource_name;

  const jsonCard({
    required this.parent_id,
    required this.resource_icon,
    required this.resource_id,
    required this.resource_name,
  });

  // jsonCard.fromJson(Map<String, dynamic> json) {
  //   this.parent_id = json["parent_id"];
  //   this.resource_icon = json["resource_icon"];
  //   this.resource_id = json["resource_id"];
  //   this.resource_name = json["resource_name"];
  // }
  factory jsonCard.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "parent_id": int parent_id,
        "resource_icon": String resource_icon,
        "resource_id": int resource_id,
        "resource_name": String resource_name,
      } =>
        jsonCard(
          parent_id: parent_id,
          resource_icon: resource_icon,
          resource_id: resource_id,
          resource_name: resource_name,
        ),
      _ => throw const FormatException(
          "Failed to load card due to invalid format."),
    };
  }
}

class jsonSidebarCard extends StatelessWidget {
  const jsonSidebarCard({
    super.key,
    required this.jCard,
    required this.index,
    required this.onPressedSidebarCard,
  });

  final jsonCard jCard;
  final int index;
  final IndexCallBack onPressedSidebarCard;

  @override
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
      ),
      onPressed: () => onPressedSidebarCard(index),
      child: Column(
        children: [
          const Icon(
            Icons.star,
            color: Colors.lightBlue,
          ), //CHANGE THIS,
          const SizedBox(
            width: 10,
          ),
          Text(
            jCard.resource_name,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class jsonSidebar extends StatefulWidget {
  const jsonSidebar({super.key});

  @override
  State<jsonSidebar> createState() => _jsonSidebarState();
}

class _jsonSidebarState extends State<jsonSidebar> {
  List<jsonCard> l1Cards = [];
  List<jsonCard> allCards = [];
  final kreaLogo = File('resources/kreaLogo.png');
  int currentCardSelection = 0;
  bool maximizeSidebar = false;
  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent('MultiDay Event A',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 12, 0),
        color: Colors.orange,
        isMultiDay: true),
    NeatCleanCalendarEvent('Allday Event B',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 15, 0),
        color: Colors.pink,
        isAllDay: true),
  ];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void readJson() async {
    String rawJson = await File("resources/jsonformatter.txt").readAsString();
    List<jsonCard> l1 = [];
    List<jsonCard> all = [];
    for (Map<String, dynamic> i in jsonDecode(rawJson)) {
      all.add(jsonCard.fromJson(i));
    }
    for (jsonCard elem in all) {
      if (elem.parent_id == 0) {
        l1.add(elem);
      }
    }
    setState(
      () {
        l1Cards = l1;
        allCards = all;
      },
    );
  }

  void onPressedSidebarButton(int index) {
    setState(() {
      currentCardSelection = index;
    });
  }

  List<jsonCard> findChildren(jsonCard parent) {
    List<jsonCard> children = [];
    for (jsonCard child in allCards) {
      if (parent.resource_id == child.parent_id) {
        children.add(child);
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            color: Colors.indigo,
            child: ListView(
              children: [
                Image.file(kreaLogo),
                for (int i = 0; i < l1Cards.length; i++)
                  jsonSidebarCard(
                    jCard: l1Cards[i],
                    index: i,
                    onPressedSidebarCard: onPressedSidebarButton,
                  ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        maximizeSidebar = !maximizeSidebar;
                      });
                    },
                    child: Column(children: [
                      const Icon(Icons.menu),
                      Text(maximizeSidebar ? "Close" : "Open"),
                    ]))
                //Text(
                // i.cardName,
                // style: const TextStyle(color: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: Stack(children: [
              Row(
                children: [
                  Container(width: 200, child: TaskList(noOfTasks: 3)),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 400,

                    // child: FittedBox(
                    child: Calendar(
                      startOnMonday: true,
                      weekDays: const [
                        'Mo',
                        'Tu',
                        'We',
                        'Th',
                        'Fr',
                        'Sa',
                        'Su'
                      ],
                      eventsList: _eventList,
                      isExpandable: true,
                      eventDoneColor: Colors.green,
                      selectedColor: Colors.pink,
                      selectedTodayColor: Colors.red,
                      todayColor: Colors.blue,
                      eventColor: null,
                      locale: 'en_EN',
                      todayButtonText: 'Go to Today',
                      allDayEventText: 'All day event',
                      multiDayEndText: 'Multi day event',
                      isExpanded: true,
                      expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                      datePickerType: DatePickerType.date,
                      dayOfWeekStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 11),
                    ),
                  ),
                  // ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: () {
                  if (maximizeSidebar &&
                      findChildren(l1Cards[currentCardSelection]).isNotEmpty) {
                    return Container(
                      width: 160,
                      color: Colors.indigo,
                      child: ListView(
                        children: [
                          for (jsonCard l2
                              in findChildren(l1Cards[currentCardSelection]))
                            Text(
                              l2.resource_name,
                              style: const TextStyle(color: Colors.white),
                            )
                        ],
                      ),
                    );
                  }
                }(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.noOfTasks});

  final int noOfTasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<bool> checkBoxVal = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<bool> vals = [for (int i = 0; i < widget.noOfTasks; i++) false];
    checkBoxVal = vals;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Center(
            child: Text("Task List"),
          ),
          const Divider(
            thickness: 2,
          ),
          for (int i = 0; i < widget.noOfTasks; i++)
            CheckboxListTile(
              value: checkBoxVal[i],
              onChanged: (bool? value) {
                setState(() {
                  checkBoxVal[i] = value!;
                });
              },
              title: (!checkBoxVal[i])
                  ? Text("Item $i")
                  : Text(
                      "Item $i",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
            )
        ],
      ),
    );
  }
}
