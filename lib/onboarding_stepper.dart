import 'package:erp_homepage/onboarding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class StepperController extends GetxController {
  var currentStep = 0.obs;

  List<Step> steps() {
    return [
      Step(
        title: Text('Personal Details'),
        content: Container(),
        isActive: currentStep >= 0,
        state: StepState.complete,
      ),
      Step(
        title: Text('Contact Details'),
        content: OnboardingForm(),
        isActive: currentStep.value >= 1,
        state: StepState.complete,
      ),
      Step(
        title: Text('Academic Details'),
        content: Container(),
        isActive: currentStep.value >= 2,
        state: StepState.complete,
      ),
      Step(
        title: Text('Health Information'),
        content: Container(),
        isActive: currentStep.value >= 3,
        state: StepState.complete,
      ),
      Step(
        title: Text('Insurance Details'),
        content: Container(),
        isActive: currentStep.value >= 4,
        state: StepState.complete,
      ),
      Step(
        title: Text('Undertakings (Student)'),
        content: Container(),
        isActive: currentStep.value >= 5,
        state: StepState.indexed,
      ),
      Step(
        title: Text('Undertakings (Parents)'),
        content: Container(),
        isActive: currentStep.value >= 6,
        state: currentStep.value >= 6 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: Text('Preferences'),
        content: Container(),
        isActive: currentStep.value >= 7,
        state: currentStep.value >= 7 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: Text('Student Declaration'),
        content: Container(),
        isActive: currentStep.value >= 8,
        state: currentStep.value >= 8 ? StepState.complete : StepState.disabled,
      ),
    ];
  }

  void setStep(int step) {
    currentStep.value = step;
  }

  void nextStep() {
    if (currentStep.value < 8) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
}

class OnboardingStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StepperController controller = Get.put(StepperController());

    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        child: Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Stepper(
                  // connectorColor: MaterialStateProperty.all(Colors.indigo),
                  type: StepperType.horizontal,
                  currentStep: controller.currentStep.value,
                  onStepTapped: (step) {
                    controller.setStep(step);
                  },
                  onStepContinue: controller.nextStep,
                  onStepCancel: controller.previousStep,
                  steps: controller.steps(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Stepper2 extends StatelessWidget {
  Stepper2({super.key});
  final StepperController controller = Get.put(StepperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: EasyStepper(
                  activeStep: controller.currentStep.value,
                  lineStyle: const LineStyle(
                    lineLength: 70,
                    lineSpace: 0,
                    lineType: LineType.normal,
                    defaultLineColor: Colors.white,
                    finishedLineColor: Colors.orange,
                  ),
                  activeStepTextColor: Colors.black87,
                  finishedStepTextColor: Colors.black87,
                  internalPadding: 0,
                  showLoadingAnimation: false,
                  stepRadius: 8,
                  showStepBorder: false,
                  steps: [
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: controller.currentStep.value >= 0
                              ? Colors.orange
                              : Colors.white,
                        ),
                      ),
                      title: 'Waiting',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: controller.currentStep.value >= 1
                              ? Colors.orange
                              : Colors.white,
                        ),
                      ),
                      title: 'Order Received',
                      topTitle: true,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: controller.currentStep.value >= 2
                              ? Colors.orange
                              : Colors.white,
                        ),
                      ),
                      title: 'Preparing',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: controller.currentStep.value >= 3
                              ? Colors.orange
                              : Colors.white,
                        ),
                      ),
                      title: 'On Way',
                      topTitle: true,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: controller.currentStep.value >= 4
                              ? Colors.orange
                              : Colors.white,
                        ),
                      ),
                      title: 'Delivered',
                    ),
                  ],
                  onStepReached: (index) => controller.setStep(index),
                ),
              ),
              Expanded(
                child: OnboardingForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
