import 'package:erp_homepage/onboarding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

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

class StatelessStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StepperController controller = Get.put(StepperController());

    return Scaffold(
      body: ConstrainedBox(
        constraints:
            BoxConstraints.tightFor(height: MediaQuery.of(context).size.height),
        child: Obx(
          () => Stepper(
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
        ),
      ),
    );
  }
}
