import 'package:erp_homepage/onboarding_stepper.dart';
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
  OnboardingForm({
    super.key,
    required this.pageFields,
  });
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final inputController = Get.put(InputController());
  // final filePickController = Get.put(FilePickerController());
  final stepController = Get.find<StepperController>();
  final List<Widget> pageFields;

  @override
  Widget build(BuildContext context) {
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
                children: [
                  for (int i = 0; i < pageFields.length; i = i + 3)
                    () {
                      if (pageFields.length - i > 2) {
                        return SizedBox(
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: pageFields[i],
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: pageFields[i + 1],
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: pageFields[i + 2],
                              )),
                            ],
                          ),
                        );
                      } else if (pageFields.length - i > 1) {
                        return SizedBox(
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: pageFields[i],
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: pageFields[i + 1],
                              )),
                              const Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(),
                              )),
                            ],
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: pageFields[i],
                              )),
                              const Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(),
                              )),
                              const Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(),
                              )),
                            ],
                          ),
                        );
                      }
                    }(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 4, 85, 151),
                        ),
                        width: 150,
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            inputController.onSave();
                          },
                          child: const Center(
                            child: Text(
                              "Save as Draft",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 4, 85, 151),
                        ),
                        width: 150,
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            stepController.previousStep();
                          },
                          child: const Center(
                            child: Text(
                              "Previous",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 4, 85, 151),
                        ),
                        width: 150,
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            stepController.nextStep();
                          },
                          child: const Center(
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
