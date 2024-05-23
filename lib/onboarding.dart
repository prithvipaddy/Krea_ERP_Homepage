import 'package:erp_homepage/onboarding_fields.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
          ],
        ),
      ),
    );
  }
}
