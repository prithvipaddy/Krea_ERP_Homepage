import 'package:erp_homepage/onboarding_fields.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OnboardingForm extends StatelessWidget {
  OnboardingForm({super.key});
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final inputController = Get.put(InputController());
  final filePickController = Get.put(FilePickerController());
  List<Widget> getPageFields() {
    return [
      TextEntryBox(
        boxName: "First name",
        requiredBox: true,
      ),
      TextEntryBox(
        boxName: "Last name",
        requiredBox: false,
      ),
      Dropdown(
        boxName: "Gender",
        requiredBox: true,
        items: [1, 2, 3],
      ),
      for (int i = 0; i < 10; i++)
        TextEntryBox(
          boxName: "Box $i",
          requiredBox: true,
        ),
      Dropdown(boxName: "test", requiredBox: true, items: ["a", "b"]),
      FilePickerBox(boxName: "file pick test", requiredBox: true),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 4, 85, 151),
        ),
        width: 10,
        height: 50,
        child: InkWell(
          onTap: () {
            inputController.onSave();
          },
          child: const Center(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final pageFields = getPageFields();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: inputController.formKey,
            child: SingleChildScrollView(
              child: Column(
                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 3,
                //   crossAxisSpacing: 50,
                //   mainAxisSpacing: 5,
                // ),
                children: pageFields,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
