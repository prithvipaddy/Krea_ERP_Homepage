import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwesomeController extends GetxController {
  String title = 'My Awesome View';
  int counter = 1;

  void upd() {
    title = "Hello ${counter++}";
    print(title);
    update();
  }
}

// ALWAYS remember to pass the `Type` you used to register your controller!
class AwesomeView extends StatelessWidget {
  const AwesomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AwesomeController>(
      initState: (a) => log("Init"),
      // init: AwesomeController,
      builder: (controller) => Material(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                controller.title,
              ), // just call `controller.something`
            ),
            ElevatedButton(
              onPressed: controller.upd,
              child: const Text("Hello"),
            )
          ],
        ),
      ),
    );
  }
}
