import 'package:erp_homepage/onboarding_fields.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Row(
            children: [
              TextEntryBox(
                boxName: "First name",
                requiredBox: true,
              ),
              SizedBox(
                width: 20,
              ),
              TextEntryBox(
                boxName: "Last name",
                requiredBox: false,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 4, 85, 151),
                ),
                width: 200,
                child: InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
