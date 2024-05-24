import 'package:erp_homepage/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      items: [1, 2, 3],
      onChanged: null,
    );
  }
}

class TextEntryBox extends StatelessWidget {
  TextEntryBox({
    super.key,
    required this.boxName,
    required this.requiredBox,
    required this.validator,
  });
  final String boxName;
  final bool requiredBox;
  final String? Function(String?)? validator;

  final InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          () {
            if (requiredBox) {
              return Text("$boxName*");
            } else {
              return Text(boxName);
            }
          }(),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Enter here",
                suffixIcon: Icon(Icons.edit_outlined),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.indigo))),
            validator: (text) => controller.validateRequiredField(text),
          ),
        ],
      ),
    );
  }
}
