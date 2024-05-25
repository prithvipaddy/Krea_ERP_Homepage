import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StepperController extends GetxController {
  var currentStep = 1.obs;

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

class StatelessStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StepperController controller = Get.put(StepperController());

    return Scaffold(
      body: Obx(
        () => Stepper(
          type: StepperType.vertical,
          currentStep: controller.currentStep.value,
          onStepTapped: (step) {
            controller.setStep(step);
          },
          onStepContinue: controller.nextStep,
          onStepCancel: controller.previousStep,
          steps: [
            Step(
              title: Text('Personal Details'),
              content: Container(),
              isActive: controller.currentStep.value >= 0,
              state: StepState.complete,
            ),
            Step(
              title: Text('Contact Details'),
              content: Container(),
              isActive: controller.currentStep.value >= 1,
              state: StepState.complete,
            ),
            Step(
              title: Text('Academic Details'),
              content: Container(),
              isActive: controller.currentStep.value >= 2,
              state: StepState.complete,
            ),
            Step(
              title: Text('Health Information'),
              content: Container(),
              isActive: controller.currentStep.value >= 3,
              state: StepState.complete,
            ),
            Step(
              title: Text('Insurance Details'),
              content: Container(),
              isActive: controller.currentStep.value >= 4,
              state: StepState.complete,
            ),
            Step(
              title: Text('Undertakings (Student)'),
              content: Container(),
              isActive: controller.currentStep.value >= 5,
              state: StepState.indexed,
            ),
            Step(
              title: Text('Undertakings (Parents)'),
              content: Container(),
              isActive: controller.currentStep.value >= 6,
              state: controller.currentStep.value >= 6
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text('Preferences'),
              content: Container(),
              isActive: controller.currentStep.value >= 7,
              state: controller.currentStep.value >= 7
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text('Student Declaration'),
              content: Container(),
              isActive: controller.currentStep.value >= 8,
              state: controller.currentStep.value >= 8
                  ? StepState.complete
                  : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
