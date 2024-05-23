import 'package:erp_homepage/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'dart:convert';
import 'main.dart';

class WelcomeCard extends StatelessWidget {
  WelcomeCard({super.key, required this.name});
  final File img = File("resources/WelcomeCardImg.png");
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.75,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 128, 205, 228),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                    width: MediaQuery.of(context).size.width / 4,
                    child: const Text(
                      "Welcome to the ERP Management System of KREA University. Access all your essential apps and resources at one place.",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 80,
                      height: 25,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 71, 129),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "Learn More",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Image.file(img),
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
      width: MediaQuery.of(context).size.width / 3.5,
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
  const EssentialWidgets({
    super.key,
    required this.allCards,
    required this.l1Cards,
  });
  final List<jsonCard> l1Cards;
  final List<jsonCard> allCards;

  @override
  State<EssentialWidgets> createState() => _EssentialWidgetsState();
}

class _EssentialWidgetsState extends State<EssentialWidgets> {
  @override
  Widget build(BuildContext context) {
    double widgetWidth = MediaQuery.of(context).size.width / 1.75;
    double widgetHeight = MediaQuery.of(context).size.height / 4;
    List<bool> added = [for (int i = 0; i < 10; i++) false];

    void onAddPressed(int i) {
      setState(() {
        added[i] = !added[i];
      });
    }

    initState() {
      for (int i = 0; i < 8; i++) {
        setState(() {
          added[i] = true;
        });
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      height: widgetHeight,
      width: widgetWidth,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 40,
                width: MediaQuery.of(context).size.width / 1.75,
                child: const Text(
                    "Access all your essential widgets at one place"),
              ),
              const Divider(),
              Container(
                width: MediaQuery.of(context).size.width / 1.75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          // width: MediaQuery.of(context).size.width / 20,
                          // height: MediaQuery.of(context).size.height / 50,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < 5; i++)
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: widget.allCards.isNotEmpty
                                        ? EssentialWidgetButtons(
                                            buttonName: widget
                                                .allCards[i].resource_name)
                                        : const Text("Loading..."),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          // width: widgetWidth /
                          //     5, // DOES THIS NOT RESPOND TO CHANGES IN SCREEN SIZE???
                          // width: MediaQuery.of(context).size.width / 20,
                          // height: MediaQuery.of(context).size.height / 50,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 5; i < 10; i++)
                                  Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: () {
                                        if (widget.allCards.isNotEmpty &&
                                            added[i]) {
                                          return EssentialWidgetButtons(
                                              buttonName: widget
                                                  .allCards[i].resource_name);
                                        } else if (widget.allCards.isNotEmpty &&
                                            !added[i]) {
                                          return AddEssentialWidget(
                                            onPressed:
                                                onAddPressed, // why is the widget not changing on state change???
                                            i: i,
                                          );
                                        } else {
                                          return const Text("Loading...");
                                        }
                                      }())
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

typedef BoolCallBack = void Function(int i);

class AddEssentialWidget extends StatelessWidget {
  const AddEssentialWidget({
    super.key,
    required this.onPressed,
    required this.i,
  });
  final BoolCallBack onPressed;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text("Additional Widget"),
        ],
      ),
      onTap: () {
        onPressed(i);
      },
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 4,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 10,
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Upcoming Events"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardContents extends StatelessWidget {
  DashboardContents({super.key, required this.allCards, required this.l1Cards});
  final List<jsonCard> l1Cards;
  final List<jsonCard> allCards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              WelcomeCard(
                name: "Full Name",
              ),
              const SizedBox(
                height: 10,
              ),
              EssentialWidgets(
                allCards: allCards,
                l1Cards: l1Cards,
              ),
              const Row(
                children: [
                  UpcomingEvents(),
                  SizedBox(
                    width: 10,
                  ),
                  TaskList(
                    noOfTasks: 3,
                  ),
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
