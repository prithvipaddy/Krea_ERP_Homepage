import 'package:erp_homepage/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'dart:convert';
import 'main.dart';
import 'calendar.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 3,
      decoration: const BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start, //WHY DOES THIS NOT REFLECT???
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome, $name",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.waving_hand),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    child: const Text(
                      "Welcome to the ERP Management System of KREA University. Access all your essential apps and resources at one place.",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Learn More"),
                  ),
                ],
              ),
              Container(
                color: Colors.amber,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
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
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 4,
      child: ListView(
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

class EssentialWidgets extends StatefulWidget {
  const EssentialWidgets({super.key});

  @override
  State<EssentialWidgets> createState() => _EssentialWidgetsState();
}

class _EssentialWidgetsState extends State<EssentialWidgets> {
  List<jsonCard> l1Cards = [];
  List<jsonCard> allCards = [];

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

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height / 3;
    double widgetWidth = MediaQuery.of(context).size.width / 4;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      height: widgetHeight,
      width: widgetWidth,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Access all your essential apps at one place"),
              const Divider(),
              Row(
                children: [
                  Container(
                    width: widgetWidth /
                        2.3, // DOES THIS NOT RESPOND TO CHANGES IN SCREEN SIZE???
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: EssentialWidgetButtons(
                                  buttonName: allCards[i].resource_name),
                            )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 5; i < 10; i++)
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: EssentialWidgetButtons(
                              buttonName: allCards[i].resource_name),
                        )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EssentialWidgetButtons extends StatefulWidget {
  const EssentialWidgetButtons({super.key, required this.buttonName});
  final String buttonName;

  @override
  State<EssentialWidgetButtons> createState() => _EssentialWidgetButtonsState();
}

class _EssentialWidgetButtonsState extends State<EssentialWidgetButtons> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          () {
            if (hovering) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Icon(Icons.star),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                child: const Icon(Icons.star),
              );
            }
          }(),
          const SizedBox(
            width: 5,
          ),
          Text(widget.buttonName),
        ],
      ),
      onTap: () {},
      onHover: (val) {
        setState(
          () {
            hovering = val;
          },
        );
      },
    );
  }
}

class DashboardContents extends StatelessWidget {
  const DashboardContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Column(
            children: [
              WelcomeCard(
                name: "Full Name",
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  TaskList(
                    noOfTasks: 3,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  EssentialWidgets(),
                ],
              ),
            ],
          ),
          Expanded(child: TableBasicsExample()),
        ],
      ),
    );
  }
}
