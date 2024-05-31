import 'package:erp_homepage/onboarding.dart';
import 'package:erp_homepage/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'onboarding_fields.dart';

class StepperController extends GetxController {
  int currentStep = 0;

  // List<Step> steps() {
  //   return [
  //     Step(
  //       title: Text('Personal Details'),
  //       content: Container(),
  //       isActive: currentStep >= 0,
  //       state: StepState.complete,
  //     ),
  //     Step(
  //       title: Text('Contact Details'),
  //       content: OnboardingForm(),
  //       isActive: currentStep >= 1,
  //       state: StepState.complete,
  //     ),
  //     Step(
  //       title: Text('Academic Details'),
  //       content: Container(),
  //       isActive: currentStep >= 2,
  //       state: StepState.complete,
  //     ),
  //     Step(
  //       title: Text('Health Information'),
  //       content: Container(),
  //       isActive: currentStep >= 3,
  //       state: StepState.complete,
  //     ),
  //     Step(
  //       title: Text('Insurance Details'),
  //       content: Container(),
  //       isActive: currentStep >= 4,
  //       state: StepState.complete,
  //     ),
  //     Step(
  //       title: Text('Undertakings (Student)'),
  //       content: Container(),
  //       isActive: currentStep >= 5,
  //       state: StepState.indexed,
  //     ),
  //     Step(
  //       title: Text('Undertakings (Parents)'),
  //       content: Container(),
  //       isActive: currentStep >= 6,
  //       state: currentStep >= 6 ? StepState.complete : StepState.disabled,
  //     ),
  //     Step(
  //       title: Text('Preferences'),
  //       content: Container(),
  //       isActive: currentStep >= 7,
  //       state: currentStep >= 7 ? StepState.complete : StepState.disabled,
  //     ),
  //     Step(
  //       title: Text('Student Declaration'),
  //       content: Container(),
  //       isActive: currentStep >= 8,
  //       state: currentStep >= 8 ? StepState.complete : StepState.disabled,
  //     ),
  //   ];
  // }

<<<<<<< HEAD
  // void setStep(int step) {
  //   currentStep = step.;
  // }
=======
  void setStep(int step) {
    currentStep = step;
    update();
  }
>>>>>>> b910631e1219a637e7eb5ac136e2b27204eebcb5

  void nextStep() {
    if (currentStep < 8) {
      currentStep++;
<<<<<<< HEAD
=======
      update();
>>>>>>> b910631e1219a637e7eb5ac136e2b27204eebcb5
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
<<<<<<< HEAD
=======
      update();
>>>>>>> b910631e1219a637e7eb5ac136e2b27204eebcb5
    }
  }
}

// class OnboardingStepper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final StepperController controller = Get.put(StepperController());

//     return Scaffold(
//       body: ConstrainedBox(
//         constraints: BoxConstraints.tightFor(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//         ),
//         child: Obx(
//           () => SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Stepper(
//                   // connectorColor: MaterialStateProperty.all(Colors.indigo),
//                   type: StepperType.horizontal,
//                   currentStep: currentStep,
//                   onStepTapped: (step) {
//                    setStep(step);
//                   },
//                   onStepContinue:nextStep,
//                   onStepCancel:previousStep,
//                   steps:steps(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Stepper2 extends GetView<InputController> {
  Stepper2({super.key});
  // final StepperController controller = Get.put(StepperController());

  // final InputController inputController = Get.put(InputController());

  // @override
  // State<Stepper2> createState() => _Stepper2State();

  int currentStep = 0;

  final FilePickerController filePickerController =
      Get.put(FilePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: EasyStepper(
                activeStep: currentStep,
                lineStyle: const LineStyle(
                  lineLength: 100,
                  lineSpace: 0,
                  lineThickness: 4,
                  lineType: LineType.normal,
                  defaultLineColor: Colors.grey,
                  finishedLineColor: Color.fromARGB(255, 30, 109, 255),
=======
      body: GetBuilder<StepperController>(
        builder: (controller) => Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: EasyStepper(
                  activeStep: controller.currentStep,
                  lineStyle: const LineStyle(
                    lineLength: 100,
                    lineSpace: 0,
                    lineThickness: 4,
                    lineType: LineType.normal,
                    defaultLineColor: Colors.grey,
                    finishedLineColor: Color.fromARGB(255, 30, 109, 255),
                  ),
                  activeStepTextColor: Colors.black87,
                  finishedStepTextColor: Colors.black87,
                  internalPadding: 48,
                  showLoadingAnimation: false,
                  stepRadius: 18,
                  showStepBorder: false,
                  steps: [
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 0
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 1
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "1",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Personal Details',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 1
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 2
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "2",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Contact Details',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 2
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 3
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "3",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Academic Details',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 3
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 4
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "4",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Health Information',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 4
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 5
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "5",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Insurance Details',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 5
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 6
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "6",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Undertakings and Consent (Student)',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 6
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 7
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "7",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Undertakings and Consent (Parents/Guardians)',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 7
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 8
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "8",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Preferences',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: controller.currentStep >= 8
                                ? Color.fromARGB(255, 30, 109, 255)
                                : Colors.grey,
                            child: controller.currentStep >= 9
                                ? const Center(
                                    child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ))
                                : const Center(
                                    child: Text(
                                    "9",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                      ),
                      customTitle: Container(
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Center(
                          child: Text(
                            'Student Declaration and Honor Pledge',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                  onStepReached: (index) => controller.setStep(index),
>>>>>>> b910631e1219a637e7eb5ac136e2b27204eebcb5
                ),
                activeStepTextColor: Colors.black87,
                finishedStepTextColor: Colors.black87,
                internalPadding: 48,
                showLoadingAnimation: false,
                stepRadius: 18,
                showStepBorder: false,
                steps: [
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 0
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 1
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "1",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Personal Details',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 1
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 2
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "2",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Contact Details',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 2
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 3
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "3",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Academic Details',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 3
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 4
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "4",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Health Information',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 4
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 5
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "5",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Insurance Details',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 5
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 6
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "6",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Undertakings and Consent (Student)',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 6
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 7
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "7",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Undertakings and Consent (Parents/Guardians)',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 7
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 8
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "8",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Preferences',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  EasyStep(
                    customStep: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 17,
                          backgroundColor: currentStep >= 8
                              ? const Color.fromARGB(255, 30, 109, 255)
                              : Colors.grey,
                          child: currentStep >= 9
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                              : const Center(
                                  child: Text(
                                  "9",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    ),
                    customTitle: SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Center(
                        child: Text(
                          'Student Declaration and Honor Pledge',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
                onStepReached: (index) => setStep(index),
              ),
            ),
<<<<<<< HEAD
          ),
          Expanded(
            child: () {
              if (currentStep == 0) {
                return OnboardingForm(
                  pageFields: [
                    TextEntryBox(
                      boxName: "First name",
                      requiredBox: true,
                    ),
                    TextEntryBox(
                      boxName: "Last name",
                      requiredBox: false,
                    ),
                  ],
                );
              } else if (currentStep == 1) {
                return OnboardingForm(
                  pageFields: [
                    for (int i = 0; i < 10; i++)
=======
            Expanded(
              child: () {
                if (controller.currentStep == 0) {
                  return OnboardingForm(
                    pageFields: [
>>>>>>> b910631e1219a637e7eb5ac136e2b27204eebcb5
                      TextEntryBox(
                        boxName: "Box $i",
                        requiredBox: true,
                      ),
                  ],
                );
              } else if (currentStep == 2) {
                return OnboardingForm(
                  pageFields: [
                    Dropdown(
                        boxName: "test",
                        requiredBox: true,
                        items: const ["a", "b"]),
                    FilePickerBox(boxName: "file pick test", requiredBox: true),
                  ],
                );
              } else {
                return OnboardingForm(
                  pageFields: [
                    TextEntryBox(
                      boxName: "First name",
                      requiredBox: true,
                    ),
                    TextEntryBox(
                      boxName: "Last name",
                      requiredBox: false,
                    ),
                    for (int i = 0; i < 10; i++)
                      TextEntryBox(
<<<<<<< HEAD
                        boxName: "Box $i",
=======
                        boxName: "Last name",
                        requiredBox: false,
                      ),
                    ],
                  );
                } else if (controller.currentStep == 1) {
                  return OnboardingForm(
                    pageFields: [
                      for (int i = 0; i < 10; i++)
                        TextEntryBox(
                          boxName: "Box $i",
                          requiredBox: true,
                        ),
                    ],
                  );
                } else if (controller.currentStep == 2) {
                  return OnboardingForm(
                    pageFields: [
                      Dropdown(
                          boxName: "test",
                          requiredBox: true,
                          items: ["a", "b"]),
                      FilePickerBox(
                          boxName: "file pick test", requiredBox: true),
                    ],
                  );
                } else {
                  return OnboardingForm(
                    pageFields: [
                      TextEntryBox(
                        boxName: "First name",
>>>>>>> b910631e1219a637e7eb5ac136e2b27204eebcb5
                        requiredBox: true,
                      ),
                    Dropdown(
                        boxName: "test",
                        requiredBox: true,
                        items: const ["a", "b"]),
                    FilePickerBox(boxName: "file pick test", requiredBox: true),
                  ],
                );
              }
            }(),
          )
        ],
      ),
    );
  }

  void setStep(int step) {
    currentStep = step;
    // setState(() {});
  }

  // void nextStep() {
  //   if (currentStep < 8) {
  //     currentStep++;
  //   }
  //   setState(() {});
  // }

  // void previousStep() {
  //   if (currentStep > 0) {
  //     currentStep--;
  //   }
  //   setState(() {});
  // }
}
