import 'package:erp_homepage/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class Dropdown extends StatelessWidget {
  Dropdown({
    super.key,
    required this.boxName,
    required this.requiredBox,
    required this.items,
  });
  final String boxName;
  final bool requiredBox;
  final List<dynamic> items;
  final InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        requiredBox ? Text("$boxName*") : Text(boxName),
        SizedBox(
          height: 14,
        ),
        CustomDropdown(
          items: items,
          onChanged: null,
          hintText: "Please Select",
          decoration: CustomDropdownDecoration(
            closedBorderRadius: BorderRadius.circular(10),
            closedBorder: Border.all(color: Colors.black),
            expandedBorderRadius: BorderRadius.circular(10),
            expandedBorder: Border.all(color: Colors.indigo),
          ),
          validator: (text) => controller.validateRequiredField(text),
        ),
      ],
    );
  }
}

class Dropdown2 extends StatelessWidget {
  Dropdown2({
    super.key,
    required this.boxName,
    required this.requiredBox,
    required this.items,
  });
  final String boxName;
  final bool requiredBox;
  final List<DropdownMenuItem<dynamic>> items;
  final InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: items.first,
      items: items,
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
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          requiredBox ? Text("$boxName*") : Text(boxName),
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
