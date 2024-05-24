import 'package:erp_homepage/onboarding_fields.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.put(InputController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formKey,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 50,
            ),
            children: [
              TextEntryBox(
                boxName: "First name",
                requiredBox: true,
                validator: (pNum) => controller.validatePhoneNum(pNum),
              ),
              TextEntryBox(
                boxName: "Last name",
                requiredBox: false,
                validator: (val) => controller.validateRequiredField(val),
              ),
              Dropdown(),
              for (int i = 0; i < 10; i++)
                TextEntryBox(
                  boxName: "Box $i",
                  requiredBox: true,
                  validator: (val) => controller.validateRequiredField(val),
                ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 4, 85, 151),
                ),
                width: 100,
                height: 50,
                child: InkWell(
                  onTap: () {
                    controller.onSave();
                  },
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
